import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../models/anime_panel_models.dart';
import '../constants.dart';

class AnimePanelApi {
  static final AnimePanelApi _instance = AnimePanelApi._();
  static AnimePanelApi get instance => _instance;
  AnimePanelApi._();

  final _dio = Dio(BaseOptions(baseUrl: AppConstants.animePanelBaseUrl));

  /// GET /api/keyboard/search?q= — keyboard-optimised, KV-cached, max 30
  Future<List<AnimePanelImage>> search(String query) async {
    final params =
        query.trim().isEmpty ? <String, dynamic>{} : {'q': query.trim()};
    final res = await _dio.get('/api/keyboard/search', queryParameters: params);
    return AnimePanelSearchResponse.fromJson(res.data).data;
  }

  /// GET /api/images/search?q= — full search with pagination (for browse screens)
  Future<AnimePanelSearchResponse> fullSearch(String query,
      {int page = 1}) async {
    final res = await _dio.get('/api/images/search', queryParameters: {
      'q': query,
      'page': page,
    });
    return AnimePanelSearchResponse.fromJson(res.data);
  }

  /// POST /api/images/:id/copy — fire-and-forget copy tracking
  Future<void> recordCopy(String imageId) async {
    try {
      await _dio.post('/api/images/$imageId/copy');
    } catch (_) {
      // Non-critical — don't surface to user
    }
  }

  /// Download raw image bytes for clipboard
  Future<Uint8List> downloadImageBytes(String url) async {
    final res = await Dio().get<List<int>>(
      url,
      options: Options(responseType: ResponseType.bytes),
    );
    return Uint8List.fromList(res.data!);
  }
}

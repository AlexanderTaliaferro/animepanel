import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import '../models/anime_panel_models.dart';
import '../models/tag.dart';
import '../models/panels_desu_models.dart';
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

  /// POST /api/upload — upload an image with metadata
  Future<Map<String, dynamic>> uploadImage({
    required File file,
    String? sourceSlug,
    List<String>? tagSlugs,
    String type = 'anime_frame',
  }) async {
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(file.path),
      if (sourceSlug != null) 'sourceSlug': sourceSlug,
      if (tagSlugs != null && tagSlugs.isNotEmpty)
        'tagSlugs': tagSlugs.join(','),
      'type': type,
    });

    final res = await _dio.post('/api/upload', data: formData);
    return res.data as Map<String, dynamic>;
  }

  /// GET /api/tags — fetch all tags
  Future<List<Tag>> getTags() async {
    final res = await _dio.get('/api/tags');
    return TagsResponse.fromJson(res.data).tags;
  }

  /// POST /api/tags — create a new tag
  Future<Tag> createTag({
    required String name,
    required String category,
  }) async {
    final res = await _dio.post('/api/tags', data: {
      'name': name,
      'category': category,
    });
    return Tag.fromJson(res.data['tag']);
  }

  /// POST /api/images/:id/tags — update image tags
  Future<void> updateImageTags({
    required String imageId,
    required List<String> tagSlugs,
  }) async {
    await _dio.post('/api/images/$imageId/tags', data: {
      'tagSlugs': tagSlugs,
    });
  }

  // ─── PanelsDesu API ──────────────────────────────────────────────────────────

  /// GET /v1/search?q=<query>&limit=<limit> from PanelsDesu
  Future<PanelsDesuResponse> searchPanelsDesu(
    String query, {
    int limit = 30,
  }) async {
    final panelsDesuDio = Dio(BaseOptions(
      baseUrl: 'https://api.panelsdesu.com',
    ));

    final res = await panelsDesuDio.get('/v1/search', queryParameters: {
      'q': query,
      'limit': limit,
    });

    return PanelsDesuResponse.fromJson(res.data);
  }
}

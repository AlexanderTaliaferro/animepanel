import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:super_clipboard/super_clipboard.dart';
import '../../core/api/anime_panel_api.dart';
import '../../core/models/panel_image.dart';

part 'home_provider.g.dart';

// ─── State ────────────────────────────────────────────────────────────────────

enum HomeStatus { idle, loading, results, empty, error }

class HomeState {
  final HomeStatus status;
  final List<PanelImage> images;
  final String query;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.idle,
    this.images = const [],
    this.query = '',
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<PanelImage>? images,
    String? query,
    String? errorMessage,
  }) =>
      HomeState(
        status: status ?? this.status,
        images: images ?? this.images,
        query: query ?? this.query,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

// ─── Notifier ─────────────────────────────────────────────────────────────────

@riverpod
class HomeNotifier extends _$HomeNotifier {
  Timer? _debounce;

  @override
  HomeState build() => const HomeState();

  void onQueryChanged(String query) {
    _debounce?.cancel();

    if (query.trim().isEmpty) {
      state = const HomeState();
      return;
    }

    state = state.copyWith(status: HomeStatus.loading, query: query);

    _debounce = Timer(const Duration(milliseconds: 350), () => _search(query));
  }

  /// Applies a tag chip directly (no debounce)
  void applyTag(String slug) {
    _debounce?.cancel();
    state = state.copyWith(status: HomeStatus.loading, query: slug);
    _search(slug);
  }

  Future<void> _search(String query) async {
    try {
      final results = await AnimePanelApi.instance.search(query);
      final images = results.map(PanelImage.fromAnimePanel).toList();

      state = state.copyWith(
        status: images.isEmpty ? HomeStatus.empty : HomeStatus.results,
        images: images,
      );
    } catch (e) {
      state = state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Search failed — check your connection.',
      );
    }
  }

  /// Copy image to clipboard and fire copy-tracking
  Future<void> copyImage(PanelImage image) async {
    try {
      final bytes =
          await AnimePanelApi.instance.downloadImageBytes(image.imageUrl);

      // Write image bytes to clipboard using super_clipboard
      final item = DataWriterItem();
      item.add(Formats.png(bytes)); // or Formats.jpeg
      await SystemClipboard.instance?.write([item]);

      // Track copy for trending algorithm
      await AnimePanelApi.instance.recordCopy(image.id);
    } catch (_) {
      // Silently fail copy — consider showing a snackbar in the UI layer
    }
  }

  void clear() {
    _debounce?.cancel();
    state = const HomeState();
  }
}

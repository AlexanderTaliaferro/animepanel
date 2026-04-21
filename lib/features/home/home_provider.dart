import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../core/api/anime_panel_api.dart';
import '../../core/models/panel_image.dart';
import '../../core/models/panels_desu_models.dart';

part 'home_provider.g.dart';

// ─── State ────────────────────────────────────────────────────────────────────

enum HomeStatus { idle, loading, results, empty, error }

class HomeState {
  final HomeStatus status;
  final List<PanelImage> images;
  final String query;
  final List<String> selectedTags;
  final String? errorMessage;

  const HomeState({
    this.status = HomeStatus.idle,
    this.images = const [],
    this.query = '',
    this.selectedTags = const [],
    this.errorMessage,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<PanelImage>? images,
    String? query,
    List<String>? selectedTags,
    String? errorMessage,
  }) =>
      HomeState(
        status: status ?? this.status,
        images: images ?? this.images,
        query: query ?? this.query,
        selectedTags: selectedTags ?? this.selectedTags,
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

    // Add tag to selected tags if not already present
    if (!state.selectedTags.contains(slug)) {
      final updatedTags = [...state.selectedTags, slug];
      final combinedQuery = updatedTags.join(' ');
      state = state.copyWith(
        status: HomeStatus.loading,
        selectedTags: updatedTags,
        query: combinedQuery,
      );
      _search(combinedQuery);
    }
  }

  /// Removes a selected tag
  void removeTag(String slug) {
    _debounce?.cancel();

    final updatedTags = state.selectedTags.where((tag) => tag != slug).toList();

    if (updatedTags.isEmpty) {
      state = const HomeState();
    } else {
      final combinedQuery = updatedTags.join(' ');
      state = state.copyWith(
        status: HomeStatus.loading,
        selectedTags: updatedTags,
        query: combinedQuery,
      );
      _search(combinedQuery);
    }
  }

  /// Removes the last selected tag
  void removeLastTag() {
    if (state.selectedTags.isEmpty) return;

    _debounce?.cancel();

    final updatedTags =
        state.selectedTags.sublist(0, state.selectedTags.length - 1);

    if (updatedTags.isEmpty) {
      state = const HomeState();
    } else {
      final combinedQuery = updatedTags.join(' ');
      state = state.copyWith(
        status: HomeStatus.loading,
        selectedTags: updatedTags,
        query: combinedQuery,
      );
      _search(combinedQuery);
    }
  }

  Future<void> _search(String query) async {
    print('Starting search for: $query');
    try {
      // Search AnimePanel API first
      print('Calling AnimePanelApi.instance.search...');
      final results = await AnimePanelApi.instance.search(query);
      print('Got ${results.length} results from AnimePanel API');
      final images = results.map(PanelImage.fromAnimePanel).toList();

      // If we have fewer than 20 results, supplement with PanelsDesu
      if (images.length < 20) {
        try {
          final PanelsDesuResponse panelsDesuResponse =
              await AnimePanelApi.instance.searchPanelsDesu(query);
          final mangaMap = panelsDesuResponse.mangaById;

          // Convert PanelsDesu panels to PanelImage
          final panelsDesuImages = panelsDesuResponse.panels.map((panel) {
            final manga = mangaMap[panel.mangaId];
            return PanelImage(
              id: 'panelsdesu_${panel.id}',
              imageUrl: panel.imageUrl,
              thumbnailUrl:
                  panel.imageUrl, // PanelsDesu doesn't have separate thumbnails
              sourceTitle: manga?.displayTitle ?? 'Unknown',
              tags: const [], // PanelsDesu doesn't provide tags
            );
          }).toList();

          // Combine results, avoiding duplicates based on imageUrl
          final seen = <String>{};
          final combined = <PanelImage>[];

          // Add AnimePanel results first
          for (final image in images) {
            if (!seen.contains(image.imageUrl)) {
              combined.add(image);
              seen.add(image.imageUrl);
            }
          }

          // Add PanelsDesu results
          for (final image in panelsDesuImages) {
            if (!seen.contains(image.imageUrl) && combined.length < 30) {
              combined.add(image);
              seen.add(image.imageUrl);
            }
          }

          state = state.copyWith(
            status: combined.isEmpty ? HomeStatus.empty : HomeStatus.results,
            images: combined,
          );
        } catch (e) {
          // If PanelsDesu fails, just use AnimePanel results
          state = state.copyWith(
            status: images.isEmpty ? HomeStatus.empty : HomeStatus.results,
            images: images,
          );
        }
      } else {
        // We have enough results from AnimePanel
        state = state.copyWith(
          status: images.isEmpty ? HomeStatus.empty : HomeStatus.results,
          images: images,
        );
      }
    } catch (e) {
      print('Search error: $e');
      state = state.copyWith(
        status: HomeStatus.error,
        errorMessage: 'Search failed — check your connection.',
      );
    }
  }

  void clear() {
    _debounce?.cancel();
    state = const HomeState();
  }

  void clearAllTags() {
    _debounce?.cancel();
    state = const HomeState();
  }
}

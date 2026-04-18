import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants.dart';
import '../../theme/my_colors.dart';
import 'home_provider.dart';
import 'widgets/tag_chip_grid.dart';
import 'widgets/panel_grid.dart';
import 'widgets/search_bar_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);
    final colors = MyColors(context);

    return Scaffold(
      backgroundColor: colors.surface,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App title (hidden once search is active)
                  if (state.status == HomeStatus.idle) ...[
                    Text(
                      '🎌 PanelReact',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: colors.displayColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Anime & manga reaction panels',
                      style: TextStyle(
                        fontSize: 14,
                        color: colors.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 14),
                  ],

                  // Search bar
                  SearchBarWidget(
                    initialValue: state.query,
                    onChanged: notifier.onQueryChanged,
                    onClear: notifier.clear,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // ── Main content ─────────────────────────────────
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: _buildContent(context, state, notifier),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    HomeState state,
    HomeNotifier notifier,
  ) {
    switch (state.status) {
      case HomeStatus.idle:
        return TagChipGrid(
          tags: AppConstants.suggestedTags,
          onTagSelected: notifier.applyTag,
        );

      case HomeStatus.loading:
        return const Center(child: CircularProgressIndicator());

      case HomeStatus.results:
        return PanelGrid(
          images: state.images,
          onTap: notifier.copyImage,
        );

      case HomeStatus.empty:
        return _EmptyState(query: state.query);

      case HomeStatus.error:
        return _ErrorState(
            message: state.errorMessage ?? 'Something went wrong');
    }
  }
}

// ─── Empty / Error states ─────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  final String query;
  const _EmptyState({required this.query});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.image_not_supported_outlined,
                size: 48, color: Colors.grey),
            const SizedBox(height: 12),
            Text('No panels for "$query"',
                style: const TextStyle(fontWeight: FontWeight.w600)),
            const SizedBox(height: 4),
            const Text('Try a different emotion or character',
                style: TextStyle(color: Colors.grey, fontSize: 13)),
          ],
        ),
      );
}

class _ErrorState extends StatelessWidget {
  final String message;
  const _ErrorState({required this.message});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded, size: 48, color: Colors.orange),
            const SizedBox(height: 12),
            Text(message,
                style: const TextStyle(fontSize: 13),
                textAlign: TextAlign.center),
          ],
        ),
      );
}

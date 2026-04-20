import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/providers/saved_images_provider.dart';
import '../../core/models/saved_image.dart';
import '../../core/models/panel_image.dart';
import '../../theme/my_colors.dart';
import '../../shared/widgets/app_floating_action_button.dart';
import '../image_detail/image_detail_screen.dart';

class SavedImagesScreen extends ConsumerWidget {
  const SavedImagesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = MyColors(context);
    final savedImages = ref.watch(savedImagesProvider);

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: AppBar(
        backgroundColor: colors.surface,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.displayColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Saved Images',
          style: TextStyle(color: colors.displayColor, fontSize: 18),
        ),
      ),
      body: savedImages.isEmpty
          ? _buildEmptyState(colors)
          : _buildImageGrid(context, savedImages),
      floatingActionButton: const AppFloatingActionButton(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniStartDocked,
    );
  }

  Widget _buildEmptyState(MyColors colors) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 64,
            color: colors.onSurfaceVariant,
          ),
          const SizedBox(height: 16),
          Text(
            'No saved images yet',
            style: TextStyle(
              color: colors.onSurface,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Bookmark images to view them here',
            style: TextStyle(
              color: colors.onSurfaceVariant,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid(BuildContext context, List<SavedImage> images) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        final savedImage = images[index];
        return _SavedImageCard(savedImage: savedImage);
      },
    );
  }
}

class _SavedImageCard extends StatelessWidget {
  final SavedImage savedImage;

  const _SavedImageCard({required this.savedImage});

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return GestureDetector(
      onTap: () {
        // Convert SavedImage to PanelImage for detail screen
        final panelImage = PanelImage(
          id: savedImage.id,
          imageUrl: savedImage.imageUrl,
          thumbnailUrl: savedImage.thumbnailUrl,
          sourceTitle: savedImage.sourceTitle,
          tags: savedImage.tags,
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ImageDetailScreen(image: panelImage),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: MyColors.accentOrange.withOpacity(0.2),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(11),
                ),
                child: CachedNetworkImage(
                  imageUrl: savedImage.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    color: MyColors.darkBlue,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: MyColors.accentOrange,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (_, __, ___) => Container(
                    color: MyColors.darkBlue,
                    child: Icon(
                      Icons.broken_image_outlined,
                      color: MyColors.accentOrange.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
            // Source info
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: MyColors.darkBlue,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(11),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    savedImage.sourceTitle,
                    style: TextStyle(
                      color: colors.onSurface,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (savedImage.tags.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      savedImage.tags.take(2).join(', '),
                      style: TextStyle(
                        color: colors.onSurfaceVariant,
                        fontSize: 10,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

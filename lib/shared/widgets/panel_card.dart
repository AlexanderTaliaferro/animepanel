import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/models/panel_image.dart';
import '../../theme/my_colors.dart';

class PanelCard extends StatelessWidget {
  final PanelImage image;
  final VoidCallback onTap;

  const PanelCard({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            CachedNetworkImage(
              imageUrl: image.thumbnailUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: MyColors.darkBlue),
              errorWidget: (_, __, ___) => Container(
                color: MyColors.darkBlue,
                child: Icon(Icons.broken_image_outlined,
                    color: MyColors.accentOrange.withOpacity(0.5)),
              ),
            ),

            // Source badge
            if (image.sourceTitle.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: colors.cardOverlay,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    image.sourceTitle,
                    style: TextStyle(
                        color: colors.reverseDisplayColor, fontSize: 9),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

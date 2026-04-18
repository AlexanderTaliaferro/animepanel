import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../core/models/panel_image.dart';
import '../../theme/my_colors.dart';

class PanelCard extends StatefulWidget {
  final PanelImage image;
  final VoidCallback onTap;

  const PanelCard({super.key, required this.image, required this.onTap});

  @override
  State<PanelCard> createState() => _PanelCardState();
}

class _PanelCardState extends State<PanelCard> {
  bool _copied = false;

  Future<void> _handleTap() async {
    widget.onTap();
    setState(() => _copied = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) setState(() => _copied = false);
  }

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return GestureDetector(
      onTap: _handleTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Image
            CachedNetworkImage(
              imageUrl: widget.image.thumbnailUrl,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(color: MyColors.darkBlue),
              errorWidget: (_, __, ___) => Container(
                color: MyColors.darkBlue,
                child: Icon(Icons.broken_image_outlined,
                    color: MyColors.accentOrange.withOpacity(0.5)),
              ),
            ),

            // Source badge
            if (widget.image.sourceTitle.isNotEmpty)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: colors.cardOverlay,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Text(
                    widget.image.sourceTitle,
                    style: TextStyle(
                        color: colors.reverseDisplayColor, fontSize: 9),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

            // "Copied!" overlay
            AnimatedOpacity(
              opacity: _copied ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                color: colors.cardOverlay,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle,
                        color: colors.successColor, size: 28),
                    const SizedBox(height: 4),
                    Text('Copied!',
                        style: TextStyle(
                          color: colors.reverseDisplayColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

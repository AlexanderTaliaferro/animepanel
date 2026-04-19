import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/models/promoted_tag.dart';
import '../../../theme/my_colors.dart';

/// Displays promoted reaction tags as square image previews
class TagChipGrid extends StatelessWidget {
  final List<PromotedTag> tags;
  final ValueChanged<String> onTagSelected;

  const TagChipGrid({
    super.key,
    required this.tags,
    required this.onTagSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Popular reactions',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.0,
            ),
            itemCount: tags.length,
            itemBuilder: (context, index) {
              final tag = tags[index];
              return _TagPreviewCard(
                tag: tag,
                onTap: () => onTagSelected(tag.tagSlug),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TagPreviewCard extends StatelessWidget {
  final PromotedTag tag;
  final VoidCallback onTap;

  const _TagPreviewCard({
    required this.tag,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: MyColors.accentOrange.withOpacity(0.3),
            width: 1.5,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(11),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image from Firestore
              if (tag.previewImageUrl != null)
                CachedNetworkImage(
                  imageUrl: tag.previewImageUrl!,
                  fit: BoxFit.cover,
                  placeholder: (_, __) => Container(
                    color: MyColors.darkBlue,
                  ),
                  errorWidget: (_, __, ___) => Container(
                    color: MyColors.darkBlue,
                  ),
                )
              else
                Container(
                  color: MyColors.darkBlue,
                ),

              // Gradient overlay for text readability
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.6),
                    ],
                  ),
                ),
              ),

              // Tag label with stroke
              Center(
                child: Stack(
                  children: [
                    // Black outline/stroke
                    Text(
                      tag.tagName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 3
                          ..color = Colors.black,
                      ),
                    ),
                    // White text
                    Text(
                      tag.tagName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constants.dart';
import '../../../theme/my_colors.dart';
import '../../../core/api/anime_panel_api.dart';

/// Displays popular reaction tags as square image previews
class TagChipGrid extends StatefulWidget {
  final List<TagSuggestion> tags;
  final ValueChanged<String> onTagSelected;

  const TagChipGrid({
    super.key,
    required this.tags,
    required this.onTagSelected,
  });

  @override
  State<TagChipGrid> createState() => _TagChipGridState();
}

class _TagChipGridState extends State<TagChipGrid> {
  final Map<String, String> _tagImages = {};
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTagImages();
  }

  Future<void> _loadTagImages() async {
    // Fetch the first image for each tag
    for (final tag in widget.tags) {
      try {
        final results = await AnimePanelApi.instance.search(tag.slug);
        if (results.isNotEmpty) {
          _tagImages[tag.slug] = results.first.thumbnailUrl;
        }
      } catch (_) {
        // Skip if fetch fails
      }
    }
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

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
            itemCount: widget.tags.length,
            itemBuilder: (context, index) {
              final tag = widget.tags[index];
              final imageUrl = _tagImages[tag.slug];
              return _TagPreviewCard(
                tag: tag,
                imageUrl: imageUrl,
                isLoading: _isLoading,
                onTap: () => widget.onTagSelected(tag.slug),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TagPreviewCard extends StatelessWidget {
  final TagSuggestion tag;
  final String? imageUrl;
  final bool isLoading;
  final VoidCallback onTap;

  const _TagPreviewCard({
    required this.tag,
    required this.imageUrl,
    required this.isLoading,
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
              // Background image
              if (imageUrl != null && !isLoading)
                CachedNetworkImage(
                  imageUrl: imageUrl!,
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
                  child: isLoading
                      ? Center(
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: MyColors.accentOrange.withOpacity(0.5),
                            ),
                          ),
                        )
                      : null,
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
                      tag.label.toUpperCase(),
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
                      tag.label.toUpperCase(),
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

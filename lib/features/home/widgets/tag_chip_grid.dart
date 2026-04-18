import 'package:flutter/material.dart';
import '../../../core/constants.dart';
import '../../../theme/my_colors.dart';

/// Displayed on the idle home screen.
/// Tapping a chip fires a search with that tag's slug immediately.
class TagChipGrid extends StatelessWidget {
  final List<TagSuggestion> tags;
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
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: colors.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tags
                .map((tag) => _TagChip(tag: tag, onTap: onTagSelected))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _TagChip extends StatelessWidget {
  final TagSuggestion tag;
  final ValueChanged<String> onTap;

  const _TagChip({required this.tag, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = MyColors(context);

    return ActionChip(
      label: Text(tag.label, style: const TextStyle(fontSize: 13)),
      onPressed: () => onTap(tag.slug),
      padding: const EdgeInsets.symmetric(horizontal: 4),
      backgroundColor: colors.tagChipBackground,
      side: BorderSide(color: MyColors.accentBlue, width: 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

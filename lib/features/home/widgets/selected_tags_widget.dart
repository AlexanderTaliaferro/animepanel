import 'package:flutter/material.dart';
import '../../../theme/my_colors.dart';

class SelectedTagsWidget extends StatelessWidget {
  final List<String> selectedTags;
  final ValueChanged<String> onRemoveTag;

  const SelectedTagsWidget({
    super.key,
    required this.selectedTags,
    required this.onRemoveTag,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedTags.isEmpty) {
      return const SizedBox.shrink();
    }

    final colors = MyColors(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: selectedTags.map((tag) {
          return Chip(
            label: Text(
              tag,
              style: const TextStyle(fontSize: 13),
            ),
            deleteIcon: Icon(
              Icons.close,
              size: 18,
              color: MyColors.accentOrange,
            ),
            onDeleted: () => onRemoveTag(tag),
            backgroundColor: colors.tagChipBackground,
            side: BorderSide(
              color: MyColors.accentOrange.withOpacity(0.5),
              width: 1,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          );
        }).toList(),
      ),
    );
  }
}

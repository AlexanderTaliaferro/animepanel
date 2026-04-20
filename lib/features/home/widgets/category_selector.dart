import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/my_colors.dart';

/// Provider for selected tag category
final selectedCategoryProvider = StateProvider<String>((ref) => 'reactions');

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  // Map category keys to display names
  static const _categoryLabels = {
    'reactions': 'Reactions',
    'themes': 'Themes',
    'moods': 'Moods',
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final colors = MyColors(context);

    // Get other categories (not selected)
    final otherCategories =
        _categoryLabels.keys.where((cat) => cat != selectedCategory).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Current selection - large
          Text(
            "Popular ${_categoryLabels[selectedCategory]}",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: MyColors.accentOrange,
            ),
          ),

          const SizedBox(height: 4),

          // Alternative options - smaller links
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Or try: ',
                style: TextStyle(
                  fontSize: 13,
                  color: colors.onSurfaceVariant,
                ),
              ),
              ...otherCategories.map((category) {
                final isLast = category == otherCategories.last;
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () => ref
                          .read(selectedCategoryProvider.notifier)
                          .state = category,
                      child: Text(
                        _categoryLabels[category]!,
                        style: TextStyle(
                          fontSize: 13,
                          color: MyColors.accentOrange.withOpacity(0.8),
                          decoration: TextDecoration.underline,
                          decorationColor:
                              MyColors.accentOrange.withOpacity(0.5),
                        ),
                      ),
                    ),
                    if (!isLast)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Text(
                          '·',
                          style: TextStyle(
                            fontSize: 13,
                            color: colors.onSurfaceVariant,
                          ),
                        ),
                      ),
                  ],
                );
              }).toList(),
            ],
          ),
        ],
      ),
    );
  }
}

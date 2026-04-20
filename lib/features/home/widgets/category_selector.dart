import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../theme/my_colors.dart';

/// Provider for selected tag category
final selectedCategoryProvider = StateProvider<String>((ref) => 'reactions');

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final colors = MyColors(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CategoryButton(
            label: 'Themes',
            category: 'themes',
            isSelected: selectedCategory == 'themes',
            onTap: () =>
                ref.read(selectedCategoryProvider.notifier).state = 'themes',
            colors: colors,
          ),
          const SizedBox(width: 12),
          _CategoryButton(
            label: 'Reactions',
            category: 'reactions',
            isSelected: selectedCategory == 'reactions',
            onTap: () =>
                ref.read(selectedCategoryProvider.notifier).state = 'reactions',
            colors: colors,
          ),
          const SizedBox(width: 12),
          _CategoryButton(
            label: 'Moods',
            category: 'moods',
            isSelected: selectedCategory == 'moods',
            onTap: () =>
                ref.read(selectedCategoryProvider.notifier).state = 'moods',
            colors: colors,
          ),
        ],
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String label;
  final String category;
  final bool isSelected;
  final VoidCallback onTap;
  final MyColors colors;

  const _CategoryButton({
    required this.label,
    required this.category,
    required this.isSelected,
    required this.onTap,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? MyColors.accentOrange : MyColors.darkBlue,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? MyColors.accentOrange
                  : MyColors.accentOrange.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? Colors.white : colors.onSurfaceVariant,
            ),
          ),
        ),
      ),
    );
  }
}

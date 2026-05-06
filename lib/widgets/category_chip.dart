import 'package:flutter/material.dart';
import '../data/app_constants.dart';

//CategoryChip
class CategoryChip extends StatelessWidget {
  final String label;
  final String emoji;
  final bool isSelected;
  final Color? color;
  final VoidCallback? onTap;

  const CategoryChip({
    super.key,
    required this.label,
    required this.emoji,
    required this.isSelected,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final chipColor = color ?? AppColors.primary;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? chipColor : AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.chipRadius),
          border: Border.all(
            color: isSelected ? chipColor : AppColors.textHint.withOpacity(0.3),
            width: 1.5,
          ),
          boxShadow: isSelected
              ? [BoxShadow(color: chipColor.withOpacity(0.25), blurRadius: 8, offset: const Offset(0, 2))]
              : [],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 14)),
            const SizedBox(width: 6),
            Text(
              label,
              style: AppTextStyles.tag.copyWith(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// CategoryChipRow 
class CategoryChipRow extends StatelessWidget {
  final List<Map<String, dynamic>> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const CategoryChipRow({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        itemCount: categories.length,
        itemBuilder: (_, i) {
          final cat = categories[i];
          return CategoryChip(
            label: cat['label'] as String,
            emoji: cat['icon'] as String,
            isSelected: selectedCategory == cat['label'],
            color: cat['color'] as Color?,
            onTap: () => onCategorySelected(cat['label'] as String),
          );
        },
      ),
    );
  }
}

// TravelSearchBar 
class TravelSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool readOnly;
  final VoidCallback? onFilterTap;

  const TravelSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search destinations, hotels...',
    this.onChanged,
    this.onTap,
    this.readOnly = false,
    this.onFilterTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSpacing.buttonRadius),
        boxShadow: [
          BoxShadow(color: AppColors.cardShadow, blurRadius: 10, offset: const Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 14),
            child: Icon(Icons.search, color: AppColors.textSecondary, size: 22),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onTap: onTap,
              readOnly: readOnly,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: AppTextStyles.bodyText.copyWith(color: AppColors.textHint),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
              style: AppTextStyles.bodyText.copyWith(color: AppColors.textPrimary),
            ),
          ),
          if (onFilterTap != null)
            GestureDetector(
              onTap: onFilterTap,
              child: Container(
                margin: const EdgeInsets.all(8),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.tune, color: Colors.white, size: 18),
              ),
            ),
        ],
      ),
    );
  }
}
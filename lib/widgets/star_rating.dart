import 'package:flutter/material.dart';
import '../data/app_constants.dart';

class StarRating extends StatelessWidget {
  final double rating;
  final double size;
  final bool showCount;
  final int? reviewCount;

  const StarRating({
    super.key,
    required this.rating,
    this.size = 14,
    this.showCount = true,
    this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    final fullStars = rating.floor();
    final hasHalf = (rating - fullStars) >= 0.5;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (int i = 0; i < 5; i++)
          Icon(
            i < fullStars
                ? Icons.star
                : (i == fullStars && hasHalf)
                    ? Icons.star_half
                    : Icons.star_border,
            size: size,
            color: AppColors.starColor,
          ),
        if (showCount && reviewCount != null) ...[
          const SizedBox(width: 4),
          Text(
            '($reviewCount)',
            style: AppTextStyles.cardSubtitle.copyWith(fontSize: size - 2),
          ),
        ],
      ],
    );
  }
}
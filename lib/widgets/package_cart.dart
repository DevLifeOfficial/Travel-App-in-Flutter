import 'package:Gusky/data/app_constants.dart';
import 'package:Gusky/models/travel_package.dart';
import 'package:Gusky/widgets/star_rating.dart';
import 'package:flutter/material.dart';


class PackageCard extends StatelessWidget {
  final TravelPackage package;
  final VoidCallback? onTap;
  final VoidCallback? onWishlistTap;
  final bool isWishlisted;
  final bool isHorizontal;  // true = full-width horizontal card, false = grid/vertical

  const PackageCard({
    super.key,
    required this.package,
    this.onTap,
    this.onWishlistTap,
    this.isWishlisted = false,
    this.isHorizontal = false,
  });

  @override
  Widget build(BuildContext context) {
    return isHorizontal ? _HorizontalCard(
      package: package,
      onTap: onTap,
      onWishlistTap: onWishlistTap,
      isWishlisted: isWishlisted,
    ) : _VerticalCard(
      package: package,
      onTap: onTap,
      onWishlistTap: onWishlistTap,
      isWishlisted: isWishlisted,
    );
  }
}

// Vertical / Grid Card 
class _VerticalCard extends StatelessWidget {
  final TravelPackage package;
  final VoidCallback? onTap;
  final VoidCallback? onWishlistTap;
  final bool isWishlisted;

  const _VerticalCard({
    required this.package,
    this.onTap,
    this.onWishlistTap,
    required this.isWishlisted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 220,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColors.cardShadow,
          //     blurRadius: 12,
          //     offset: const Offset(0, 4),
          //   ),
          // ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with overlays
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(AppSpacing.cardRadius),
              ),
              child: Stack(
                children: [
                  Image.network(
                    package.imageUrl,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 150,
                      color: AppColors.background,
                      child: const Icon(Icons.image_not_supported, color: AppColors.textHint),
                    ),
                  ),
                  // Gradient overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(gradient: AppColors.heroGradient),
                    ),
                  ),
                  // Duration badge
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        package.durationLabel,
                        style: AppTextStyles.tag.copyWith(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ),
                  // Wishlist button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: onWishlistTap,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isWishlisted ? Icons.favorite : Icons.favorite_border,
                          size: 16,
                          color: isWishlisted ? AppColors.accent : AppColors.textSecondary,
                        ),
                      ),
                    ),
                  ),
                  // Featured badge
                  if (package.isFeatured)
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          'Featured',
                          style: AppTextStyles.tag.copyWith(color: Colors.white, fontSize: 10),
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category chip
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      package.category,
                      style: AppTextStyles.tag.copyWith(
                        color: AppColors.primary,
                        fontSize: 10,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Title
                  Text(
                    package.title,
                    style: AppTextStyles.cardTitle.copyWith(fontSize: 14),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),

                  // Destination
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 12, color: AppColors.textSecondary),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          package.destination,
                          style: AppTextStyles.cardSubtitle.copyWith(fontSize: 11),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Rating + Price row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StarRating(rating: package.rating, size: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            package.priceLabel,
                            style: AppTextStyles.priceTag.copyWith(fontSize: 15),
                          ),
                          Text(
                            'per person',
                            style: AppTextStyles.cardSubtitle.copyWith(fontSize: 9),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Horizontal / List Card 
class _HorizontalCard extends StatelessWidget {
  final TravelPackage package;
  final VoidCallback? onTap;
  final VoidCallback? onWishlistTap;
  final bool isWishlisted;

  const _HorizontalCard({
    required this.package,
    this.onTap,
    this.onWishlistTap,
    required this.isWishlisted,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          boxShadow: [
            BoxShadow(color: AppColors.cardShadow, blurRadius: 10, offset: const Offset(0, 3)),
          ],
        ),
        child: Row(
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(AppSpacing.cardRadius),
              ),
              child: Image.network(
                package.imageUrl,
                width: 110,
                height: 110,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 110,
                  height: 110,
                  color: AppColors.background,
                ),
              ),
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(package.title,
                              style: AppTextStyles.cardTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                        GestureDetector(
                          onTap: onWishlistTap,
                          child: Icon(
                            isWishlisted ? Icons.favorite : Icons.favorite_border,
                            size: 18,
                            color: isWishlisted ? AppColors.accent : AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 2),
                        Expanded(
                          child: Text(package.destination,
                              style: AppTextStyles.cardSubtitle, maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 4),
                        Text(package.durationLabel, style: AppTextStyles.cardSubtitle.copyWith(fontSize: 12)),
                        const Spacer(),
                        StarRating(rating: package.rating, size: 11, showCount: false),
                        const SizedBox(width: 4),
                        Text('${package.rating}', style: AppTextStyles.tag.copyWith(color: AppColors.textPrimary)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text(
                      package.priceLabel,
                      style: AppTextStyles.priceTag,
                    ),
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
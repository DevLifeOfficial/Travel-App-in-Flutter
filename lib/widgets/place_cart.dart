import 'package:flutter/material.dart';
import '../models/tourist_place.dart';
import '../data/app_constants.dart';
import 'star_rating.dart';

class PlaceCard extends StatelessWidget {
  final TouristPlace place;
  final VoidCallback? onTap;
  final bool isCompact;

  const PlaceCard({
    super.key,
    required this.place,
    this.onTap,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isCompact) return _CompactPlaceCard(place: place, onTap: onTap);
    return _FullPlaceCard(place: place, onTap: onTap);
  }
}

class _FullPlaceCard extends StatelessWidget {
  final TouristPlace place;
  final VoidCallback? onTap;
  const _FullPlaceCard({required this.place, this.onTap});

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
            ClipRRect(
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(AppSpacing.cardRadius)),
              child: Stack(
                children: [
                  Image.network(
                    place.imageUrl,
                    width: 115,
                    height: 125,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 115, height: 125, color: AppColors.background),
                  ),
                  if (place.isUNESCO)
                    Positioned(
                      bottom: 6,
                      left: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1565C0),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text('UNESCO', style: AppTextStyles.tag.copyWith(color: Colors.white, fontSize: 8)),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(place.name, style: AppTextStyles.cardTitle, maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 2),
                        Text(place.locationLabel, style: AppTextStyles.cardSubtitle.copyWith(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        StarRating(rating: place.rating, size: 12, showCount: false),
                        const SizedBox(width: 4),
                        Text('${place.rating}', style: AppTextStyles.tag.copyWith(fontSize: 12)),
                        Text(' (${place.reviewCount})', style: AppTextStyles.cardSubtitle.copyWith(fontSize: 11)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(place.category,
                            style: AppTextStyles.tag.copyWith(color: AppColors.primary, fontSize: 11)),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.access_time, size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 3),
                        Text(place.durationLabel, style: AppTextStyles.cardSubtitle.copyWith(fontSize: 11)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.confirmation_number_outlined, size: 12, color: AppColors.textSecondary),
                        const SizedBox(width: 3),
                        Expanded(
                          child: Text(place.entryFee,
                            style: AppTextStyles.cardSubtitle.copyWith(fontSize: 11),
                            maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                      ],
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

class _CompactPlaceCard extends StatelessWidget {
  final TouristPlace place;
  final VoidCallback? onTap;
  const _CompactPlaceCard({required this.place, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          boxShadow: [BoxShadow(color: AppColors.cardShadow, blurRadius: 8, offset: const Offset(0, 3))],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppSpacing.cardRadius)),
              child: Image.network(place.imageUrl, height: 110, width: double.infinity, fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(height: 110, color: AppColors.background)),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(place.name, style: AppTextStyles.cardTitle.copyWith(fontSize: 13),
                    maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 3),
                  Text(place.city, style: AppTextStyles.cardSubtitle.copyWith(fontSize: 11)),
                  const SizedBox(height: 5),
                  StarRating(rating: place.rating, size: 11, showCount: false),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
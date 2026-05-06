class TouristPlace {
  final String id;
  final String name;
  final String city;
  final String country;
  final String imageUrl;
  final List<String> galleryImages;
  final double rating;
  final int reviewCount;
  final String category;    // Heritage, Nature, Adventure, Religious, Beach, Museum
  final String description;
  final String openingHours;
  final String entryFee;    // e.g., "₹500 (Indians) / ₹1000 (Foreigners)" or "Free"
  final List<String> bestTimeToVisit;
  final List<String> nearbyAttractions;
  final bool isUNESCO;
  final double latitude;
  final double longitude;
  final int visitDurationMinutes;  // avg time to spend

  const TouristPlace({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.galleryImages,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.description,
    required this.openingHours,
    required this.entryFee,
    required this.bestTimeToVisit,
    required this.nearbyAttractions,
    this.isUNESCO = false,
    required this.latitude,
    required this.longitude,
    required this.visitDurationMinutes,
  });

  String get durationLabel {
    if (visitDurationMinutes < 60) return '$visitDurationMinutes min';
    final hours = visitDurationMinutes ~/ 60;
    final mins = visitDurationMinutes % 60;
    return mins == 0 ? '$hours hr' : '$hours hr $mins min';
  }

  String get locationLabel => '$city, $country';
}
class TravelPackage {
  final String id;
  final String title;
  final String destination;
  final String country;
  final String imageUrl;
  final List<String> galleryImages;
  final double pricePerPerson;
  final int durationDays;
  final int durationNights;
  final double rating;
  final int reviewCount;
  final String category;       // Beach, Adventure, Cultural, Luxury, Budget
  final List<String> inclusions;
  final List<String> exclusions;
  final List<String> highlights;
  final String description;
  final bool isFeatured;
  final bool isPopular;
  final int maxGroupSize;
  final String difficulty;     // Easy, Moderate, Challenging
  final String bestSeason;

  const TravelPackage({
    required this.id,
    required this.title,
    required this.destination,
    required this.country,
    required this.imageUrl,
    required this.galleryImages,
    required this.pricePerPerson,
    required this.durationDays,
    required this.durationNights,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.inclusions,
    required this.exclusions,
    required this.highlights,
    required this.description,
    this.isFeatured = false,
    this.isPopular = false,
    required this.maxGroupSize,
    required this.difficulty,
    required this.bestSeason,
  });

  String get durationLabel => '$durationDays Days / $durationNights Nights';
  String get priceLabel => '₹${pricePerPerson.toStringAsFixed(0)}';
}
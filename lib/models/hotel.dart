class Hotel {
  final String id;
  final String name;
  final String city;
  final String country;
  final String imageUrl;
  final List<String> galleryImages;
  final double pricePerNight;
  final double rating;
  final int reviewCount;
  final int starRating;          // 1-5 official stars
  final List<String> amenities;
  final String description;
  final String address;
  final double latitude;
  final double longitude;
  final bool hasPool;
  final bool hasSpa;
  final bool hasGym;
  final bool isFreeBreakfast;
  final bool isRefundable;
  final String roomType;         // Standard, Deluxe, Suite, Villa
  final String checkInTime;
  final String checkOutTime;

  const Hotel({
    required this.id,
    required this.name,
    required this.city,
    required this.country,
    required this.imageUrl,
    required this.galleryImages,
    required this.pricePerNight,
    required this.rating,
    required this.reviewCount,
    required this.starRating,
    required this.amenities,
    required this.description,
    required this.address,
    required this.latitude,
    required this.longitude,
    this.hasPool = false,
    this.hasSpa = false,
    this.hasGym = false,
    this.isFreeBreakfast = false,
    this.isRefundable = true,
    required this.roomType,
    this.checkInTime = '14:00',
    this.checkOutTime = '12:00',
  });

  String get priceLabel => '₹${pricePerNight.toStringAsFixed(0)}/night';
  String get locationLabel => '$city, $country';
}
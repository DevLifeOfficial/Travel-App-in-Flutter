class Review {
  final String id;
  final String authorName;
  final String authorAvatar;  // image URL or initials fallback
  final double rating;
  final String comment;
  final DateTime date;
  final String itemId;      // package / hotel / place id
  final String itemType;    // 'package' | 'hotel' | 'place'
  final List<String> photoUrls;

  const Review({
    required this.id,
    required this.authorName,
    required this.authorAvatar,
    required this.rating,
    required this.comment,
    required this.date,
    required this.itemId,
    required this.itemType,
    this.photoUrls = const [],
  });

  String get initials {
    final parts = authorName.split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    return authorName.substring(0, 2).toUpperCase();
  }

  String get timeAgo {
    final diff = DateTime.now().difference(date);
    if (diff.inDays > 365) return '${diff.inDays ~/ 365}y ago';
    if (diff.inDays > 30) return '${diff.inDays ~/ 30}mo ago';
    if (diff.inDays > 0) return '${diff.inDays}d ago';
    return 'Today';
  }
}
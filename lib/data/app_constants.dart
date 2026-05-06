import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary        = Color(0xFF1A6B8A);  // deep teal
  static const Color primaryLight   = Color(0xFF2DA0C5);
  static const Color accent         = Color(0xFFFF7043);  // sunset orange
  static const Color accentLight    = Color(0xFFFF8A65);
  static const Color background     = Color(0xFFF5F7FA);
  static const Color surface        = Color(0xFFFFFFFF);
  static const Color textPrimary    = Color(0xFF1A1F2E);
  static const Color textSecondary  = Color(0xFF6B7280);
  static const Color textHint       = Color(0xFFADB5BD);
  static const Color starColor      = Color(0xFFFFC107);
  static const Color error          = Color(0xFFE53935);
  static const Color success        = Color(0xFF2E7D32);
  static const Color cardShadow     = Color(0x1A000000);

  static const LinearGradient heroGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x00000000), Color(0xCC000000)],
  );

  static const LinearGradient splashGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A6B8A), Color(0xFF0D3B55)],
  );
}

class AppTextStyles {
  AppTextStyles._();

  static const String fontFamily = 'Poppins';

  static const TextStyle heroTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    height: 1.2,
    letterSpacing: -0.5,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle cardSubtitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle priceTag = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.accent,
  );

  static const TextStyle tag = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle bodyText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.6,
  );
}

class AppSpacing {
  AppSpacing._();

  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 16.0;
  static const double lg  = 24.0;
  static const double xl  = 32.0;
  static const double xxl = 48.0;

  static const double cardRadius     = 16.0;
  static const double chipRadius     = 20.0;
  static const double buttonRadius   = 12.0;
  static const double imageRadius    = 12.0;
}

class AppRoutes {
  AppRoutes._();

  static const String home     = '/';
  static const String packages = '/packages';
  static const String hotels   = '/hotels';
  static const String places   = '/places';
  static const String detail   = '/detail';
  static const String wishlist = '/wishlist';
  static const String search   = '/search';
}

class AppCategories {
  AppCategories._();

  static const List<Map<String, dynamic>> packageCategories = [
    {'label': 'All',       'icon': '🌍', 'color': Color(0xFF1A6B8A)},
    {'label': 'Beach',     'icon': '🏖️', 'color': Color(0xFF00ACC1)},
    {'label': 'Adventure', 'icon': '🏔️', 'color': Color(0xFF558B2F)},
    {'label': 'Cultural',  'icon': '🏛️', 'color': Color(0xFF7B1FA2)},
    {'label': 'Luxury',    'icon': '💎', 'color': Color(0xFFF57F17)},
    {'label': 'Budget',    'icon': '💰', 'color': Color(0xFF00695C)},
    {'label': 'Wildlife',  'icon': '🦁', 'color': Color(0xFFBF360C)},
    {'label': 'Honeymoon', 'icon': '🌹', 'color': Color(0xFFC2185B)},
  ];

  static const List<Map<String, dynamic>> placeCategories = [
    {'label': 'All',       'icon': '📍'},
    {'label': 'Heritage',  'icon': '🏯'},
    {'label': 'Nature',    'icon': '🌿'},
    {'label': 'Adventure', 'icon': '🧗'},
    {'label': 'Religious', 'icon': '🕌'},
    {'label': 'Beach',     'icon': '🏄'},
    {'label': 'Museum',    'icon': '🖼️'},
  ];

  static const List<String> sortOptions = [
    'Recommended',
    'Price: Low to High',
    'Price: High to Low',
    'Rating',
    'Duration',
  ];
}
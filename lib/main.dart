import 'package:Gusky/screens/Search/search_screen.dart';
import 'package:Gusky/widgets/splash_screen.dart';
import 'package:flutter/material.dart';
import 'data/app_constants.dart';

void main() {
  runApp(const GuskyApp());
}

class GuskyApp extends StatelessWidget {
  const GuskyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gusky Travel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
          secondary: AppColors.accent,
          background: AppColors.background,
          surface: AppColors.surface,
        ),
        fontFamily: AppTextStyles.fontFamily,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.surface,
          indicatorColor: AppColors.primary.withOpacity(0.12),
          labelTextStyle: MaterialStateProperty.all(
            AppTextStyles.tag.copyWith(fontSize: 11),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          filled: false,
        ),
      ),
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const SplashScreen(),
        // Add other screens here:
        // AppRoutes.packages: (_) => const PackagesScreen(),
        // AppRoutes.hotels:   (_) => const HotelsScreen(),
        // AppRoutes.places:   (_) => const PlacesScreen(),
        // AppRoutes.wishlist: (_) => const WishlistScreen(),
           AppRoutes.search: (_) => const SearchScreen(),
      },
    );
  }
}

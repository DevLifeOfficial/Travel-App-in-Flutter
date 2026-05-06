

import 'package:Gusky/data/app_constants.dart';
import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
  });

  void _handleNavigation(BuildContext context, int i) {
    switch (i) {
      case 0:
        Navigator.pushNamed(context, AppRoutes.home);
        break;
      case 1:
        Navigator.pushNamed(context, AppRoutes.packages);
        break;
      case 2:
        Navigator.pushNamed(context, AppRoutes.hotels);
        break;  
      case 3:
        Navigator.pushNamed(context, AppRoutes.places);
        break;
      case 4:
        Navigator.pushNamed(context, AppRoutes.wishlist);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
  data: NavigationBarThemeData(
    indicatorColor: AppColors.primary.withOpacity(0.12),

    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return const IconThemeData(color: AppColors.primary);
      }
      return const IconThemeData(color: AppColors.textSecondary);
    }),

    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppTextStyles.tag.copyWith(color: AppColors.primary);
      }
      return AppTextStyles.tag.copyWith(color: AppColors.textSecondary);
    }),
  ),
  child: NavigationBar(
    selectedIndex: currentIndex,
    onDestinationSelected: (i) => _handleNavigation(context, i),
    destinations: const [
      NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
      NavigationDestination(icon: Icon(Icons.luggage_outlined), selectedIcon: Icon(Icons.luggage), label: 'Packages'),
      NavigationDestination(icon: Icon(Icons.hotel_outlined), selectedIcon: Icon(Icons.hotel), label: 'Hotels'),
      NavigationDestination(icon: Icon(Icons.place_outlined), selectedIcon: Icon(Icons.place), label: 'Places'),
      NavigationDestination(icon: Icon(Icons.favorite_border), selectedIcon: Icon(Icons.favorite), label: 'Wishlist'),
    ],
  ),
);
  }
}
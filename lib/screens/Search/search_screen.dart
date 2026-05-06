import 'package:Gusky/widgets/AppBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:Gusky/data/app_constants.dart';
import 'package:Gusky/data/mock_data.dart';
import 'package:Gusky/models/hotel.dart';
import 'package:Gusky/models/tourist_place.dart';
import 'package:Gusky/models/travel_package.dart';
import 'package:Gusky/widgets/package_cart.dart';
import 'package:Gusky/widgets/place_cart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String _query = '';

  List<TravelPackage> _filteredPackages = mockPackages;
  List<Hotel> _filteredHotels = mockHotels;
  List<TouristPlace> _filteredPlaces = mockPlaces;

  void _search(String value) {
    setState(() {
      _query = value.toLowerCase();

      _filteredPackages = mockPackages
          .where((pkg) =>
              pkg.title.toLowerCase().contains(_query) ||
              pkg.destination.toLowerCase().contains(_query))
          .toList();

      _filteredHotels = mockHotels
          .where((hotel) =>
              hotel.name.toLowerCase().contains(_query) ||
              hotel.city.toLowerCase().contains(_query))
          .toList();

      _filteredPlaces = mockPlaces
          .where((place) =>
              place.name.toLowerCase().contains(_query) ||
              place.city.toLowerCase().contains(_query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text("Search", style: AppTextStyles.heroTitle),
      ),
      body:SafeArea(child: 
       Column(
        children: [
          _buildSearchBar(),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
              children: [

                /// 🔹 PACKAGES
                if (_filteredPackages.isNotEmpty) ...[
                  _sectionTitle("Packages"),

                  SizedBox(
                    height: 280,
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md),
                      scrollDirection: Axis.horizontal,
                      itemCount: _filteredPackages.length,
                      separatorBuilder: (_, __) =>
                          const SizedBox(width: AppSpacing.sm),
                      itemBuilder: (_, i) {
                        return PackageCard(
                          package: _filteredPackages[i],

                        );
                      },
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),
                ],

                /// 🔹 PLACES
                if (_filteredPlaces.isNotEmpty) ...[
                  _sectionTitle("Places"),

                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.xs),
                    itemCount: _filteredPlaces.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: AppSpacing.xs),
                    itemBuilder: (_, i) {
                      return PlaceCard(
                        place: _filteredPlaces[i],
                      );
                    },
                  ),
                ],

                /// 🔹 EMPTY STATE
                if (_filteredPackages.isEmpty &&
                    _filteredPlaces.isEmpty)
                  _emptyState(),
              ],
            ),
          ),
        ],
      ),

      
    ), 
    bottomNavigationBar: AppBottomNav(currentIndex: 0),);

    
  }

  /// 🔍 SEARCH BAR
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSpacing.cardRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow,
              blurRadius: 10,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: TextField(
          onChanged: _search,
          decoration: InputDecoration(
            hintText: "Search destinations, hotels...",
            hintStyle: AppTextStyles.bodyText.copyWith(
              color: AppColors.textHint,
            ),
            prefixIcon: const Icon(Icons.search),
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    );
  }

  /// 📌 SECTION TITLE
  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        AppSpacing.sm,
        AppSpacing.md,
        AppSpacing.sm,
      ),
      child: Text(
        title,
        style: AppTextStyles.sectionTitle,
      ),
    );
  }

  /// ❌ EMPTY STATE
  Widget _emptyState() {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.xl),
      child: Column(
        children: [
          Icon(Icons.search_off,
              size: 60, color: AppColors.textHint),
          const SizedBox(height: AppSpacing.md),
          Text(
            "No results found",
            style: AppTextStyles.sectionTitle,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            "Try searching something else",
            style: AppTextStyles.bodyText,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  
}
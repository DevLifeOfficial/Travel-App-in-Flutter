import 'package:Gusky/data/app_constants.dart';
import 'package:Gusky/data/mock_data.dart';
import 'package:Gusky/widgets/AppBottomNav.dart';
import 'package:Gusky/widgets/category_chip.dart';
import 'package:Gusky/widgets/package_cart.dart';
import 'package:Gusky/widgets/place_cart.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentNavIndex = 0;
  String _selectedCategory = 'All';
  final Set<String> _wishlistedIds = {};

  void _toggleWishlist(String id) {
    setState(() {
      _wishlistedIds.contains(id) ? _wishlistedIds.remove(id) : _wishlistedIds.add(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Hero App Bar
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppColors.primary,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/Cherry.jpg',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      decoration: const BoxDecoration(gradient: AppColors.splashGradient),
                    ),
                  ),
                  // Dark gradient overlay
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0x55000000), Color(0xDD000000)],
                      ),
                    ),
                  ),
                  // Hero content
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 80, 20, 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Greeting
                        Text('Welcome to Gusky ✈️',
                          style: AppTextStyles.cardSubtitle.copyWith(
                              color: Colors.white70, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text('Where will you\ngo next?',
                          style: AppTextStyles.heroTitle),
                        const SizedBox(height: 16),
                        // Stats row
                        Row(
                          children: [
                            _StatBadge(label: '${mockPackages.length}+ Packages', icon: Icons.luggage),
                            const SizedBox(width: 12),
                            _StatBadge(label: '${mockHotels.length}+ Hotels', icon: Icons.hotel),
                            const SizedBox(width: 12),
                            _StatBadge(label: '${mockPlaces.length}+ Places', icon: Icons.place),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.person_outline, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),

          // Search Bar 
          SliverToBoxAdapter(
            child: TravelSearchBar(
              readOnly: true,
              onTap: () => Navigator.pushNamed(context, AppRoutes.search),
              onFilterTap: () {
                // Implement filter action
                // Example: Navigator.pushNamed(context, AppRoutes.filter);
              },
            ),
          ),

          // ── Package Categories 
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                  child: Text('Explore Packages', style: AppTextStyles.sectionTitle),
                ),
                CategoryChipRow(
                  categories: AppCategories.packageCategories,
                  selectedCategory: _selectedCategory,
                  onCategorySelected: (cat) => setState(() => _selectedCategory = cat),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // ── Featured Packages
          SliverToBoxAdapter(
            child: SizedBox(
              height: 285,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: featuredPackages.length,
                separatorBuilder: (_, __) => const SizedBox(width: 14),
                itemBuilder: (_, i) {
                  final pkg = featuredPackages[i];
                  return PackageCard(
                    package: pkg,
                    isWishlisted: _wishlistedIds.contains(pkg.id),
                    onWishlistTap: () => _toggleWishlist(pkg.id),
                    onTap: () => Navigator.pushNamed(context, AppRoutes.detail,
                      arguments: {'type': 'package', 'id': pkg.id}),
                  );
                },
              ),
            ),
          ),

          // ── Popular Packages (List) ───────────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Popular Right Now 🔥', style: AppTextStyles.sectionTitle),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.packages),
                    child: Text('See All', style: AppTextStyles.tag.copyWith(color: AppColors.primary)),
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, i) {
                final pkg = popularPackages[i];
                return PackageCard(
                  package: pkg,
                  isHorizontal: true,
                  isWishlisted: _wishlistedIds.contains(pkg.id),
                  onWishlistTap: () => _toggleWishlist(pkg.id),
                  onTap: () => Navigator.pushNamed(context, AppRoutes.detail,
                    arguments: {'type': 'package', 'id': pkg.id}),
                );
              },
              childCount: popularPackages.length.clamp(0, 3),
            ),
          ),

          // ── Must-Visit Places 
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Must-Visit Places 📍', style: AppTextStyles.sectionTitle),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, AppRoutes.places),
                        child: Text('See All', style: AppTextStyles.tag.copyWith(color: AppColors.primary)),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: mockPlaces.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (_, i) => PlaceCard(
                      place: mockPlaces[i],
                      isCompact: true,
                      onTap: () => Navigator.pushNamed(context, AppRoutes.detail,
                        arguments: {'type': 'place', 'id': mockPlaces[i].id}),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),

          // ── Hotels Near You 
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Top Hotels 🏨', style: AppTextStyles.sectionTitle),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.hotels),
                    child: Text('See All', style: AppTextStyles.tag.copyWith(color: AppColors.primary)),
                  ),
                ],
              ),
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 80)),
        ],
      ),

      // ── Bottom Navigation 
    bottomNavigationBar: AppBottomNav(currentIndex: 0),
    );
  }
}

class _StatBadge extends StatelessWidget {
  final String label;
  final IconData icon;
  const _StatBadge({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white24),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 13, color: Colors.white70),
        const SizedBox(width: 5),
        Text(label, style: AppTextStyles.tag.copyWith(color: Colors.white, fontSize: 11)),
      ],
    ),
  );
}
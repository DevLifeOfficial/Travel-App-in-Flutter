import 'package:Gusky/data/app_constants.dart';
import 'package:Gusky/models/travel_package.dart';
import 'package:flutter/material.dart';

class PackageDetailsScreen extends StatelessWidget {
  final TravelPackage package;

  const PackageDetailsScreen({super.key, required this.package});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(package.title)),
      body: Column(
        children: [
          Image.asset(
            package.imageUrl,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(package.title, style: AppTextStyles.sectionTitle),
                const SizedBox(height: 8),
                Text(package.description, style: AppTextStyles.bodyText),
                const SizedBox(height: 8),
                Text(
                  "₹${package.pricePerPerson.toStringAsFixed(2)} per person",
                  style: AppTextStyles.priceTag,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

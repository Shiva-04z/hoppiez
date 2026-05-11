import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/core/navigation/navigation.dart';

import '../../../../data/local/models/restaurant.dart';

class RestaurantSearchCard extends StatelessWidget {
  final Restaurant restaurant;
  final double distanceKm;

  const RestaurantSearchCard({
    super.key,
    required this.restaurant,
    this.distanceKm = 7.9,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.back();
        Get.toNamed(Navigation.restaurantScreen, arguments: restaurant);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                restaurant.images.isNotEmpty
                    ? restaurant.images.first
                    : "https://via.placeholder.com/100",
                height: 91,
                width: 77,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "${restaurant.address} • $distanceKm kms",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Color(0xFF666666),
                    ),
                  ),

                  const SizedBox(height: 4),

                  RichText(
                    text: TextSpan(
                      text: "₹${restaurant.averagePricePerPerson * 2} for two",
                      children: [
                        TextSpan(
                          text: ' • ',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: Color(0xFFF12535),
                          ),
                          children: [
                            TextSpan(
                              text: restaurant.cuisines.first.name,
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: Color(0xFF666666),
                              ),
                            ),
                          ],
                        ),
                      ],
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        color: Color(0xFF666666),
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // 🔹 RATING ROW
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFF008C43),
                        size: 14,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        restaurant.rating.toStringAsFixed(1),
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: .w500,
                          color: Color(0xFF000000),
                        ),
                      ),

                      const SizedBox(width: 6),

                      Text(
                        "(${restaurant.reviews.length})",
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          fontWeight: .w500,
                          color: Color(0xFF999999),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

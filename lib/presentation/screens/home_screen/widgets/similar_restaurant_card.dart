import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/core/navigation/navigation.dart';
import 'package:hoppiez/data/local/models/restaurant.dart';

class SimilarRestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  SimilarRestaurantCard({super.key, required this.restaurant});

  final PageController _pageController = PageController();

  final RxInt currentPage = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Get.back();
          Get.toNamed(Navigation.restaurantScreen, arguments: restaurant);
        },
        child: SizedBox(
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: .start,
            children: [
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _pageController,
                      itemCount: restaurant.images.length,
                      onPageChanged: (index) {
                        currentPage.value = index;
                      },
                      itemBuilder: (context, index) {
                        return Image.asset(
                          restaurant.images[index],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),

                    if (restaurant.rating >= 4)
                      Positioned(
                        top: 6,
                        right: 6,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF12535),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            spacing: 3,
                            children: [
                              Text(
                                "UP\nTO",
                                style: GoogleFonts.inter(
                                  fontSize: 8,
                                  color: const Color(0xFFFEFEFE),
                                  fontWeight: .w700,
                                ),
                              ),

                              Text(
                                "50",
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  color: const Color(0xFFFEFEFE),
                                  fontWeight: .w700,
                                ),
                              ),
                              Text(
                                "%\nOFF",
                                style: GoogleFonts.inter(
                                  fontSize: 8,
                                  color: const Color(0xFFFEFEFE),
                                  fontWeight: .w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Obx(
                        () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(restaurant.images.length, (
                            index,
                          ) {
                            final isActive = currentPage.value == index;

                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? Color(0xFFF12535)
                                    : Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: .spaceEvenly,
                  spacing: 10,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Expanded(
                          child: Text(
                            restaurant.name,
                            style: GoogleFonts.inter(
                              color: Color(0xFF000000),
                              fontSize: 14,
                              fontWeight: .w800,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          color: Colors.redAccent,
                          size: 10,
                        ),

                        Expanded(
                          child: Text(
                            "${restaurant.address}, ${restaurant.city}",
                            style: GoogleFonts.inter(
                              color: Color(0xFF666666),
                              fontSize: 9,
                              fontWeight: .w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      "${restaurant.cuisines.first.name} • ₹${restaurant.averagePricePerPerson} for two",
                      style: GoogleFonts.inter(
                        color: Color(0xFF666666),
                        fontSize: 9,
                        fontWeight: .w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.green, size: 14),

                        const SizedBox(width: 3),

                        RichText(
                          text: TextSpan(
                            text: restaurant.rating.toStringAsFixed(1),
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              fontWeight: .w500,
                              color: Color(0xFF000000),
                            ),
                            children: [
                              TextSpan(
                                text: " (${restaurant.reviews.length}) ",
                                style: GoogleFonts.inter(
                                  fontSize: 9,
                                  fontWeight: .w500,
                                  color: const Color(0xFF999999),
                                ),
                              ),
                            ],
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
      ),
    );
  }
}

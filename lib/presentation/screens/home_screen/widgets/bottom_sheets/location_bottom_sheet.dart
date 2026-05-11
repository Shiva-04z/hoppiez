import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/empty_card.dart';

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();

    final RxList<String> cities = List<String>.from(RestaurantStore.cities).obs;

    Timer? debounceTimer; // 🔥 local debounce

    return Container(
      height: Get.height * 0.88,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white)),
            ),
            child: Row(
              children: [
                Text(
                  "Locations",
                  style: GoogleFonts.inter(fontSize: 18, fontWeight: .w800),
                ),

                const Spacer(),

                InkWell(
                  onTap: () {
                    controller.searchController.clear();
                    Get.back();
                  },
                  child: const Icon(
                    Icons.close,
                    size: 28,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          TextFormField(
            controller: controller.searchController,

            onChanged: (value) {
              // cancel previous timer
              debounceTimer?.cancel();

              debounceTimer = Timer(const Duration(milliseconds: 300), () {
                final allCities = RestaurantStore.cities;

                if (value.isEmpty) {
                  cities.value = List.from(allCities);
                } else {
                  final q = value.toLowerCase();

                  cities.value = allCities
                      .where((c) => c.toLowerCase().contains(q))
                      .toList();
                }
              });
            },

            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,

              hintText: "Search city, area, or locality",
              hintStyle: GoogleFonts.sen(
                fontSize: 14,
                color: Color(0xFFA9ABB4),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

                borderSide: BorderSide(color: Colors.grey.shade300),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),

                borderSide: const BorderSide(color: Colors.red),
              ),

              prefixIcon: IconButton(
                onPressed: () {},

                icon: SvgPicture.asset("assets/icons/search.svg"),
              ),

              suffixIcon: IconButton(
                onPressed: () {
                  controller.goToMap();
                },

                icon: SvgPicture.asset("assets/icons/map_pin.svg"),
              ),
            ),
          ),

          const SizedBox(height: 16),

          GestureDetector(
            onTap: () async {
              await controller.fetchLocation();
            },

            child: Container(
              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: const Color(0xFFFFF6F6),

                borderRadius: BorderRadius.circular(18),

                border: Border.all(color: Colors.red),
              ),

              child: Row(
                children: [
                  const Icon(Icons.gps_fixed, color: Colors.red),

                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Use my current location",
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Obx(
                              () =>
                              Text(
                                controller.address.value,

                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  color: Colors.black54,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            child: Obx(
                  () =>
              cities.isEmpty
                  ? const EmptyCard(title: "Cities")
                  : ListView.builder(
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  final city = cities[index];

                  return InkWell(
                    key: ValueKey(city),
                    onTap: () {
                      controller.address.value = ",$city";
                      controller.applyFilters();
                      controller.searchController.clear();
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            city,
                            style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            color: Colors.grey.shade300,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

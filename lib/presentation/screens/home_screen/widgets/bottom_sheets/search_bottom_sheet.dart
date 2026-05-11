import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/data/local/models/restaurant.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/empty_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/restaurant_search_card.dart';

import '../../../../../data/local/dummy/restaurant_store.dart';
import '../../home_screen_controller.dart';
import '../restaurant_card.dart';


class SearchBottomSheet extends StatelessWidget {
  const SearchBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();

    final RxList<Restaurant> restaurants =
        List<Restaurant>.from(RestaurantStore.restaurants).obs;

    Timer? debounceTimer;

    return Container(
      height: Get.height * 0.88,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:  4,right: 4, top:16,bottom: 4),
            child: Row(
              spacing: 10,
              children: [
                InkWell(child: Icon(Icons.arrow_back), onTap: () {
                  Get.back();
                },),
                Expanded(
                  child: Obx(
                   ()=> TextFormField(
                      controller: controller.searchController,
                      focusNode: controller.focusNode,
                      onChanged: (value) {
                        // cancel previous timer
                        controller.isSearchEmpty.value = value.isEmpty;
                        debounceTimer?.cancel();

                        debounceTimer = Timer(
                          const Duration(milliseconds: 300),
                              () {
                            final allRestaurants = RestaurantStore.restaurants;

                            if (value.isEmpty) {
                              restaurants.value = List.from(allRestaurants);
                            } else {
                              final q = value.toLowerCase();

                              restaurants.value = allRestaurants
                                  .where((c) =>
                              c.name.toLowerCase().contains(q) ||
                                  c.city.toLowerCase().contains(q))
                                  .toList();
                            }
                          },
                        );
                      },

                      decoration: InputDecoration(
                        filled: true,
                        fillColor: controller.isFocused.value ?  Color(0xFFFFF6F6)  :Colors.white,



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

                        suffixIcon: Row(
                          mainAxisSize: .min,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.goToMap();
                              },

                              icon: SvgPicture.asset("assets/icons/map_pin.svg"),
                            ),

                          if(!controller.isSearchEmpty.value)  IconButton(
                              onPressed: () {
                                controller.searchController.clear();
                              },

                              icon: Icon(Icons.clear),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


          const SizedBox(height: 16),

          SizedBox(height: 10,),

          Expanded(
            child: Obx(
                  () =>
                  restaurants.isEmpty ? const EmptyCard(title: "restaurants"):
                  ListView.builder(
                    itemCount: restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurants[index];

                      return InkWell(
                        onTap: () {
                          controller.searchController.clear();
                          Get.back();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                            horizontal: 8,
                          ),
                          child: RestaurantSearchCard(restaurant: restaurant),
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
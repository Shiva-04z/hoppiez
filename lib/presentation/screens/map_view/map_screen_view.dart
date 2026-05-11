import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/similar_restaurant_card.dart';

import 'map_screen_controller.dart';

class MapScreenView extends GetView<MapScreenController> {
  const MapScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: controller.currentPosition.value,
                initialZoom: 15,

                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.all,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  userAgentPackageName: 'com.shivalik.hoppiez',
                ),

                MarkerLayer(
                  markers: [
                    Marker(
                      point: controller.currentPosition.value,
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.location_pin,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Positioned(
              top: 60,
              left: 24,
              child: InkWell(
                onTap: (){Get.back();},
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 18.5,
                  child: Icon(Icons.arrow_back, size: 24),
                ),
              ),
            ),
            Align(
              alignment: AlignmentGeometry.bottomLeft,
              child: Container(
                height: 280,

                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Center(
                    child: ListView.builder(
                      itemExtent: 180,
                      scrollDirection: .horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        final random = Random();
                        int sti = random.nextInt(
                          RestaurantStore.restaurants.length - 1,
                        );
                        final restaurant = RestaurantStore.restaurants[sti];
                        return SimilarRestaurantCard(
                          restaurant: restaurant,
                          key: ValueKey(index),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';

class RestaurantMenus extends StatelessWidget {
  const RestaurantMenus({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 180,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.restaurant.menus.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Image.asset(
                controller.restaurant.menus[index],
                width: 150,
              ),
            );
          },
        ),
      ),
    );
  }
}

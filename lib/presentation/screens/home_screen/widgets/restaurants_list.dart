import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/data/local/models/restaurant.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/empty_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/restaurant_card.dart';

class RestaurantsList extends StatelessWidget {
  const RestaurantsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Obx(
      () => controller.filteredRestaurants.isEmpty
          ? SliverToBoxAdapter(child: const EmptyCard(title: "restaurants"))
          : SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final Restaurant restaurant =
                    controller.filteredRestaurants[index];
                return RestaurantCard(
                  key: ValueKey(restaurant.id),
                  restaurant: restaurant,
                );
              }, childCount: controller.filteredRestaurants.length),
            ),
    );
  }
}

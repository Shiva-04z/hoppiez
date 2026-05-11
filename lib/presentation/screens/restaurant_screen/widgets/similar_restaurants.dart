import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoppiez/data/local/models/restaurant.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/similar_restaurant_card.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';

class SimilarRestaurants extends StatelessWidget {
  const SimilarRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 250,
        child: ListView.builder(
          scrollDirection: .horizontal,
          itemExtent: 180,
          itemBuilder: (context, index) {
            final Restaurant restaurant = controller.restaurants[index];
            return SimilarRestaurantCard(
              restaurant: restaurant,
              key: ValueKey(restaurant.id),
            );
          },
          itemCount: 5,
        ),
      ),
    );
  }
}

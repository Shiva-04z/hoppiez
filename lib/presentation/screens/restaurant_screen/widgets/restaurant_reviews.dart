import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hoppiez/data/local/models/review.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/widgets/review_card.dart';

class RestaurantReviews extends StatelessWidget {
  const RestaurantReviews({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 263,
          child: ListView.builder(
            scrollDirection: .horizontal,
            itemExtent: 276,
            itemBuilder: (context, index) {
              final Review review = controller.restaurant.reviews[index];
              return ReviewCard(review: review, key: ValueKey((review.id)));
            },
            itemCount: controller.restaurant.reviews.length,
          ),
        ),
      ),
    );
  }
}

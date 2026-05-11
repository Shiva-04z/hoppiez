import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hoppiez/data/local/models/restaurant.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/widgets/restaurant_app_bar.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/widgets/restaurant_menus.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/widgets/restaurant_reviews.dart';
import 'package:hoppiez/presentation/widgets/decorated_divider.dart';

class RestaurantScreenView extends GetView<RestaurantScreenController> {
  @override
  Widget build(BuildContext context) {
    final Restaurant restaurant = Get.arguments;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
               const RestaurantAppBar(),
                const DecoratedDivider(title: "MENU"),
                const RestaurantMenus(),
                const DecoratedDivider(title: "REVIEWS"),
                const RestaurantReviews(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 40,
                            endIndent: 10,
                            color: Color(0xFFCACACA),
                            thickness: 1,
                          ),
                        ),
                        Text(
                          "SIMILAR RESTAURANTS",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: .w500,
                            color: Color(0xFF586C83),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            indent: 10,
                            endIndent: 40,
                            color: Color(0xFFCACACA),
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: .center,
            children: [
              SizedBox(
                height: 55,
                width: 354,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFF12535),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Book a Table",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 16,
                      fontWeight: .w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}

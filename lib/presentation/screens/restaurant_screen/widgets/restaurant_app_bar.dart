import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/widgets/restaurant_summary_widget.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();
    return  SliverAppBar(
      expandedHeight: 378,
      leading: SizedBox(),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            SizedBox(
              height: 418,
              child: Image.asset(
                controller.restaurant.images.first,
                fit: BoxFit.fitHeight,
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,

              child: SizedBox(
                width: 356,
                height: 189,
                child: const RestaurantSummaryWidget(),
              ),
            ),
            Positioned(
              top: 36,
              left: 24,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
              ),
            ),
            Positioned(
              top: 36,
              right: 74,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 36,
              right: 24,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ios_share, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

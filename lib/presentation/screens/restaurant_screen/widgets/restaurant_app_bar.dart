import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/widgets/restaurant_summary_widget.dart';

class RestaurantAppBar extends StatelessWidget {
  const RestaurantAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();

    return SliverAppBar(
      pinned: true,
      expandedHeight: 378,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final top = constraints.biggest.height;
          final isCollapsed = top <= kToolbarHeight + 40;

          return Stack(
            children: [
              FlexibleSpaceBar(
                centerTitle: false,

                title: isCollapsed
                    ? Text(
                        controller.restaurant.name,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      )
                    : null,

                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      controller.restaurant.images.first,
                      fit: BoxFit.cover,
                    ),

                    Positioned(
                      bottom: 16,
                      left: 16,
                      right: 16,
                      child: SizedBox(
                        height: 189,
                        child: const RestaurantSummaryWidget(),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top + 4,
                left: 12,
                child: isCollapsed
                    ? IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back, color: Colors.black),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top + 4,
                right: 74,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),

              Positioned(
                top: MediaQuery.of(context).padding.top + 4,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.ios_share, color: Colors.black),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      leading: SizedBox(),
    );

  }
}

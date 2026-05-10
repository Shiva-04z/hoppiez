import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 130,
            backgroundColor: const Color(0xFFFDF3F3),

            elevation: 0,

            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: SafeArea(
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentGeometry.topRight,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/location.svg",
                            ),
                          ),

                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment:
                            CrossAxisAlignment.start,

                            children: [
                              Row(
                                children: [
                                  Obx(
                                        () => Text(
                                      controller.address.value
                                          .split(",")[0],

                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),

                                  const Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: Colors.red,
                                  ),
                                ],
                              ),

                              Obx(
                                    () => Text(
                                  controller.address.value
                                      .split(",")[1],

                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(90),

              child: Container(
                color: const Color(0xFFFDF3F3),

                padding: const EdgeInsets.fromLTRB(
                  24,
                  0,
                  24,
                  16,
                ),

                child: TextFormField(
                  controller: controller.searchController,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,

                    hintText: "Search",

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),

                    prefixIcon: IconButton(
                      onPressed: () {},

                      icon: SvgPicture.asset(
                        "assets/icons/search.svg",
                      ),
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {},

                      icon: SvgPicture.asset(
                        "assets/icons/map_pin.svg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
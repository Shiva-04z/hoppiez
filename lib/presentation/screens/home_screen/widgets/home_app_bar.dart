import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 140,
      backgroundColor: const Color(0xFFFDF3F3),
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        background: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset("assets/icons/location.svg"),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Text(
                                  controller.address.value.split(",")[0],

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
                              controller.address.value.split(",")[1],

                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0x86FA8B8B),
                          child:SvgPicture.asset("assets/icons/user.svg") ,
                        ),
                      )
                    ],
                  ),
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

          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),

          child: TextFormField(
            controller: controller.searchController,

            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,

              hintText: "Search city, area, or locality",
              hintStyle: GoogleFonts.sen(fontSize: 14,color: Color(0xFFA9ABB4)),

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

              suffixIcon: IconButton(
                onPressed: () {},

                icon: SvgPicture.asset("assets/icons/map_pin.svg"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

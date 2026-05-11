import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';
import 'package:hoppiez/presentation/widgets/decorated_divider.dart';

class RestaurantAbout extends StatelessWidget {
  const RestaurantAbout({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Color(0xFFF4F4F4),
          child: SizedBox(

            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: .start,
                spacing: 15,
                children: [
                  const SizedBox(),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          indent: 30,
                          endIndent: 10,
                          color: Color(0xFFCACACA),
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsGeometry.all(4),
                        child: SvgPicture.asset("assets/icons/decoration.svg"),
                      ),
                      const Text(
                        "ABOUT",
                        style: TextStyle(
                          fontWeight: .w500,
                          color: const Color(0xFF586C83),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsGeometry.all(4),
                        child: SvgPicture.asset("assets/icons/decoration.svg"),
                      ),
                      const Expanded(
                        child: Divider(
                          indent: 10,
                          endIndent: 30,
                          color: Color(0xFFCACACA),
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      SvgPicture.asset("assets/icons/cash.svg"),
                      Text(
                        "₹${controller.restaurant.averagePricePerPerson * 2} for Two",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF383838),
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      SvgPicture.asset("assets/icons/spa.svg"),
                      Text(
                        "${controller.restaurant.cuisines.first.name}",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF383838),
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      SvgPicture.asset("assets/icons/location.svg"),
                      Text(
                        controller.restaurant.address,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF383838),
                          fontWeight: .w700,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "FACILITIES",
                    style: TextStyle(
                      color: Color(0xFF909DAC),
                      fontWeight: .w700,
                      fontSize: 15,
                    ),
                  ),
                  Center(
                    child: Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: controller.restaurant.facilities.map(
                            (e) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width / 2 - 64,
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle_outlined,
                                  color: Color(0xFF000000),
                                  size: 20,
                                ),

                                const SizedBox(width: 10),

                                Expanded(
                                  child: Text(
                                    e.name,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

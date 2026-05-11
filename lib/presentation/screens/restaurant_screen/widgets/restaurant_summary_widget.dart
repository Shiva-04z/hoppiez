import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoppiez/core/navigation/navigation.dart';

import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';

import '../../../widgets/bars.dart';

class RestaurantSummaryWidget extends StatelessWidget {
  const RestaurantSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();
    final restaurant = controller.restaurant;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          spacing: 2,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            Text(
              "${restaurant.address}. 7.9 kms",
              style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
            ),

            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 14, color: Color(0xFF666666)),
                children: [
                  TextSpan(
                    text: restaurant.cuisines.isNotEmpty
                        ? restaurant.cuisines.first.name
                        : "Restaurant",
                  ),
                  const TextSpan(
                    text: "  •  ",
                    style: TextStyle(
                      color: Color(0xFFF12535),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                    text: "₹${restaurant.averagePricePerPerson * 2} for two",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF666666),
                    ),
                  ),
                ],
              ),
            ),

            Row(
              spacing: 10,
              children: [
                Container(
                  height: 27,
                  decoration: BoxDecoration(
                    color: const Color(0X0F969696),
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      spacing: 10,
                      mainAxisAlignment: .spaceAround,
                      children: [
                        const Icon(
                          Icons.watch_later_outlined,
                          size: 12,
                          color: Colors.black54,
                        ),

                        Text(
                          "Opens at 6:30 PM",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  restaurant.isOpen ? "Open" : "Closed",
                  style: TextStyle(
                    color: restaurant.isOpen
                        ? const Color(0xFF00F800)
                        : const Color(0xFFF80000),
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),

            const Divider(indent: 10, endIndent: 10, color: Color(0xFFE7E7E7)),

            Row(
              spacing: 10,
              children: [
                InkWell(
                  onTap: () {
                    Get.offNamed(
                      Navigation.mapScreen,
                      arguments: restaurant,
                    );
                  },
                  child: Container(
                    height: 27,
                    width: 99,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFFDF5F6),
                    ),

                    child: Row(
                      mainAxisAlignment: .center,
                      spacing: 4,
                      children: [
                        SizedBox(
                          height: 15,
                          width: 15,
                          child: Image.asset("assets/icons/directions.png"),
                        ),
                        const Text(
                          "Directions",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: .w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Bars.showSuccessBar("Call pressed", "Should make a call");
                  },
                  child: Container(
                    height: 27,
                    width: 63,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFFDF5F6),
                    ),

                    child: Row(
                      mainAxisAlignment: .center,
                      spacing: 2,
                      children: [
                        SvgPicture.asset("assets/icons/call.svg"),
                        const Text(
                          "Call",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: .w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 27,
                    width: 87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFFEFFFF7),
                    ),

                    child: Row(
                      mainAxisAlignment: .center,
                      spacing: 4,
                      children: [
                        SvgPicture.asset("assets/icons/star.svg"),
                        Text(
                          restaurant.rating.toStringAsFixed(1),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: .w500,
                            color: Color(0xFF000000),
                          ),
                        ),
                        Text(
                          "(${restaurant.reviews.length})",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: .w500,
                            color: Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

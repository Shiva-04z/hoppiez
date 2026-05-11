import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/price_card/price_chip.dart';

class PriceCard extends StatelessWidget {
  const PriceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Padding(
      padding: const EdgeInsets.only(top:2.0,bottom: 8.0),
      child: Container(
       color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pricing for two",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("₹ 0", style: TextStyle(fontSize: 18)),
                  Text("₹ 6000+", style: TextStyle(fontSize: 18)),
                ],
              ),

              Obx(
                    () =>
                        SliderTheme(
                          data: SliderThemeData(
                            activeTrackColor: Colors.red,
                            inactiveTrackColor: Colors.red.shade100,
                            thumbColor: Colors.red,
                            overlayColor: Colors.red.shade100,
                            valueIndicatorColor: Colors.red,
                            valueIndicatorTextStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                            showValueIndicator: ShowValueIndicator.always,
                            trackHeight: 4,
                          ),
                          child: RangeSlider(
                            values: RangeValues(
                              controller.minPrice.value,
                              controller.maxPrice.value,
                            ),
                            min: 0,
                            max: 6000,
                            divisions: 60,
                            labels: RangeLabels(
                              '₹${controller.minPrice.value.round()}',
                              '₹${controller.maxPrice.value.round()}',
                            ),
                            onChanged: (values) {
                              controller.minPrice.value = values.start;
                              controller.maxPrice.value = values.end;
                            },
                          ),
                        )
              ),

              const SizedBox(height: 10),

              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 12,
                  children: controller.priceOptions
                      .map(
                        (e) =>
                        Obx(
                              () =>
                              PriceChip(price: e, isSelected: controller
                                  .selectedPrice.value == e),
                        ),
                  )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

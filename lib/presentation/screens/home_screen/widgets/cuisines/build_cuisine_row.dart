import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

import '../../../../../data/local/dummy/restaurant_store.dart';
import 'cuisine_card.dart';

class BuildCuisineRow extends StatelessWidget {
  const BuildCuisineRow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Padding(
      padding: const EdgeInsets.only(top:2.0,bottom: 8.0),
      child: Container(
        color: Colors.white,
        height: 200,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 10,
            children: [

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cuisine",style: GoogleFonts.inter(fontSize: 14,fontWeight: .w600),),
              ),
              SizedBox(),

              SizedBox(
                width: double.infinity,
                height: 120,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: .min,
                    spacing: 15,
                    children: RestaurantStore.cuisines
                        .map(
                          (e) => Obx(
                            () => CuisineCard(
                              cuisine: e,
                              isSelected: controller.selectedCuisine.contains(e.id),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

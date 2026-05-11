import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/ratings/rating_chip.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key});

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
            crossAxisAlignment: .start,
            spacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Guest Ratings",style: GoogleFonts.inter(fontSize: 14,fontWeight: .w600),),
              ),
              SingleChildScrollView(
                scrollDirection: .horizontal,
                child: Row(
                  spacing: 10,
                  children: controller.starOptions.map((e) {
                    return Obx(
                      () => RatingChip(
                        stars: e,
                        isSelected: controller.selectedStars.value == e,
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}

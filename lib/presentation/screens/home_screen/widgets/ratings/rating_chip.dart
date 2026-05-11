import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

class RatingChip extends StatelessWidget {
  final String stars;
  final bool  isSelected;
  const RatingChip({super.key, required this.stars, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return InkWell(
      onTap: (){
        controller.selectedStars.value = stars;
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:isSelected?Colors.red.shade300: const Color(0xFFD8D8D8)),
        ),
        child: Row(
          spacing: 20,
          mainAxisAlignment: .spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              stars,
              style: GoogleFonts.inter(
                color: isSelected ? Colors.red : Color(0xFF666666),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            Icon(
              Icons.star,
              size: 16,
              color: isSelected ? Colors.red : Color(0xFFF5BD00),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

class PriceChip extends StatelessWidget {
  final String price;
  final bool isSelected;

  const PriceChip({super.key, required this.price, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return InkWell(
      onTap: () {
        controller.selectedPrice.value = price;
      },
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Colors.red.shade300 : const Color(0xFFD8D8D8),
          ),
        ),
        child: Row(
          mainAxisAlignment: .spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              price,
              style: GoogleFonts.inter(
                color: isSelected ? Colors.red : Color(0xFF666666),
                fontSize: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
    ;
    ;
  }
}

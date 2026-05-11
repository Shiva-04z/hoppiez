import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

import '../../../../../data/local/models/cusine.dart';

class CuisineCard extends StatelessWidget {
  final Cuisine cuisine;
  final bool isSelected;

  const CuisineCard({
    super.key,
    required this.cuisine,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return InkWell(
      onTap: () {
        isSelected
            ? controller.selectedCuisine.remove(cuisine.id)
            : controller.selectedCuisine.add(cuisine.id);
      },
      child: Container(
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusGeometry.circular(16),
          border: Border.all(
            color: isSelected ? Colors.red.shade300 : Colors.grey.shade300,
          ),
          gradient: LinearGradient(
            colors: [Colors.white, cuisine.color],
            begin: AlignmentGeometry.center,
            end: AlignmentGeometry.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4),
              child: Text(
                cuisine.name,
                textAlign: TextAlign.left,
                softWrap: true,
                style: GoogleFonts.inter(fontSize: 13, fontWeight: .w600),
              ),
            ),
            Row(),
            Expanded(child: SizedBox(height: 10)),
            Stack(
              children: [
                Align(
                  alignment: .bottomEnd,
                  child: SizedBox(
                    height: 80,
                    width: 120,
                    child: Image.asset(cuisine.image, fit: BoxFit.fill),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}

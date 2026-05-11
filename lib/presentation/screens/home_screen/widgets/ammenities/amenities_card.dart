import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/data/local/models/facility.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

class AmenitiesCard extends StatelessWidget {
  final Facility facility;
  final bool isSelected;

  const AmenitiesCard({
    super.key,
    required this.facility,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          isSelected
              ? controller.selectedAmenities.remove(facility.id)
              : controller.selectedAmenities.add(facility.id);
        },
        child: Card(
          shape: ContinuousRectangleBorder(
            side: BorderSide(
              color: isSelected ? Colors.red.shade300 : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

              children: [
                SizedBox(width: 10,),
                Icon(
                  Icons.no_photography_outlined,
                  color: isSelected ? Colors.red : const Color(0xFF666666),
                ),
                SizedBox(width:  30,),
                Text(
                  facility.name,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: isSelected?Colors.red: const Color(0xFF666666),
                    fontWeight: .w400,
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

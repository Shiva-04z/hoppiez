import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';

class SelectableFilterCard extends StatelessWidget {
  final String title;
  final bool isApplied;

  const SelectableFilterCard({
    super.key,
    required this.title,
    required this.isApplied,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();

    return FilterChip(
      selected: isApplied,

      // Removes default tick mark
      showCheckmark: false,

      // Show cross icon when selected
      deleteIcon: const Icon(
        Icons.close,
        color: Colors.red,
        size: 18,
      ),

      // Needed for delete icon to appear
      onDeleted: isApplied
          ? () {
        controller.selectedFilters.remove(title);
      }
          : null,

      label: Text(
        title,
        style: TextStyle(
          color: isApplied ? Colors.red : Colors.black,
          fontWeight: FontWeight.w500,
        ),
      ),

      shape: ContinuousRectangleBorder(
        side: BorderSide(
          color: isApplied ? Colors.red : Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(18),
      ),

      selectedColor: Colors.red.withOpacity(0.08),
      backgroundColor: Colors.white,

      onSelected: (val) {
        if (isApplied) {
          controller.selectedFilters.remove(title);
        } else {
          controller.selectedFilters.add(title);
        }
      },
    );
  }
}
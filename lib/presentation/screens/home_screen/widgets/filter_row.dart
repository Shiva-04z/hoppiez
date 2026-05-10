import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/selectable_filter_card.dart';

import 'build_dropdown_chip.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final controller = Get.find<HomeScreenController>();
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        scrollDirection: .horizontal,
        child: Row(
          spacing: 15,
          children: [
            const SizedBox(),
            Chip(
              label: Text("Filters"),
              backgroundColor: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              onDeleted: () {},
              deleteIcon: SvgPicture.asset(
                "assets/icons/filter.svg",
                height: 200,
              ),
            ),
            ...controller.filterOptions.map(
              (e) => Obx(
                () => SelectableFilterCard(
                  title: e,
                  isApplied: controller.selectedFilters.contains(e),
                ),
              ),
            ),
            Obx(
              () => BuildDropdownChip(
                value: controller.selectedPrice.isEmpty
                    ? "Price"
                    : controller.selectedPrice.value,
                items: controller.priceOptions,
                onSelected: controller.setPrice,
              ),
            ),
            Obx(
              () => BuildDropdownChip(
                value: controller.selectedType.isEmpty
                    ? "Type"
                    : controller.selectedType.value,
                items: controller.typeOptions,
                onSelected: controller.setType,
              ),
            ),
            Obx(
              () => BuildDropdownChip(
                value: controller.selectedStars.isEmpty
                    ? "Stars"
                    : controller.selectedStars.value,
                items: controller.starOptions,
                onSelected: controller.setStar,
              ),
            ),
            Obx(
              () => BuildDropdownChip(
                value: controller.selectedSort.isEmpty
                    ? "Sort"
                    : controller.selectedSort.value,
                items: controller.sortOptions,
                onSelected: controller.setSort,
              ),
            ),

            Chip(
              label: Text("Clear All"),
              deleteIcon: Icon(Icons.close),
              backgroundColor: Colors.white,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(18),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              onDeleted: () {
                controller.clearAll();
              },
            ),

            const SizedBox(),
          ],
        ),
      ),
    );
  }
}

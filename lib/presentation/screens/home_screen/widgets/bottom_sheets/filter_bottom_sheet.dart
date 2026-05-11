import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/ammenities/amenities_list.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/cuisines/build_cuisine_row.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/cuisines/cuisine_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/price_card/price_card.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/ratings/rating_card.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();

    return Container(
      height: Get.height * 0.88,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Color(0xFFF7F7F7),
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.white)),
            ),
            child: Row(
              children: [
                Text(
                  "Filters",
                  style: GoogleFonts.inter(fontSize: 18,fontWeight: .w800),
                ),

                const Spacer(),

                InkWell(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.close,
                    size: 28,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const PriceCard(),

                  const RatingCard(),

                  const AmenitiesList(),

                  const BuildCuisineRow(),
                ],
              ),
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
            decoration: const BoxDecoration(color: Colors.white),
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: controller.clearAll,
                    child: Center(
                      child: Text(
                        "Reset",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: .w600,
                          color: const Color(0XFFF12535),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 18),

                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: 62,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.applyFilters();
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        "Apply Filters",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: .w600,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _chip({
    required String title,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? Colors.red : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? Colors.red : const Color(0xFFD7D7D7),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }


}

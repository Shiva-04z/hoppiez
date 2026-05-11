import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/data/local/models/facility.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/widgets/ammenities/amenities_card.dart';

class AmenitiesList extends StatelessWidget {
  const AmenitiesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeScreenController>();
    return Padding(
      padding:  const EdgeInsets.only(top:2.0,bottom: 8.0),
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
                child: Text("Amenities",style: GoogleFonts.inter(fontSize: 14,fontWeight: .w600),),
              ),
              SizedBox(
                height: 250,
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: RestaurantStore.facilities.length,
                  itemBuilder: (context, index) {
                    final Facility facility = RestaurantStore.facilities[index];
                    return Obx(
                      ()=> AmenitiesCard(
                        facility: facility,
                        isSelected: controller.selectedAmenities.contains(facility.id),
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 70,

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

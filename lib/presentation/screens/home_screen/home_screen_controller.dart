import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoppiez/presentation/widgets/bars.dart';

class HomeScreenController extends GetxController {
  RxString address = "Sector 28,Noida".obs;
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getLocationPermission();
  }

  Future<void> getLocationPermission() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      Bars.showWarningBar(
        "Error in location access",
        "Location is denied Forever",
      );
      return;
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      print('Permission granted.');
    }
  }
}

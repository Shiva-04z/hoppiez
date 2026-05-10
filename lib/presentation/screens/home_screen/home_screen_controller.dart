import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoppiez/presentation/widgets/bars.dart';

class HomeScreenController extends GetxController {
  RxString address = "Sector 28,Noida".obs;
  final TextEditingController searchController = TextEditingController();
  RxBool isSearching = false.obs;

  RxList<String> selectedFilters = <String>[].obs;

  RxString selectedPrice = "".obs;
  RxString selectedType = "".obs;
  RxString selectedSort = "".obs;
  RxString selectedStars = "".obs;

  final List<String> priceOptions = [
    "Under ₹1K",
    "Under ₹5K",
    "Under ₹10K",
    "₹10K or More",
  ];

  final List<String> typeOptions = ["Hotel", "Resort"];

  final List<String> starOptions = ["5", "4", "3", "2", "1"];

  final List<String> sortOptions = ["Price Low to High", "Price High to Low"];

  final List<String> filterOptions = [
    "Available Today",
    "4+ Rating",
    "Within 5Km",
    "Hotels Only",
    "Pool",
  ];

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

  void setPrice(String value) {
    selectedPrice.value = value;
  }

  void setType(String value) {
    selectedType.value = value;
  }

  void setStar(String value) {
    selectedStars.value = value;
  }

  void setSort(String value) {
    selectedSort.value = value;
  }

  void clearAll() {
    selectedPrice.value = "";
    selectedType.value = "";
    selectedSort.value = "";
    selectedStars.value = "";
    selectedFilters.clear();
  }
}

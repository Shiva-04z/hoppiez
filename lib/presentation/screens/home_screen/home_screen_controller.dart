import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hoppiez/core/navigation/navigation.dart';
import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/data/local/models/restaurant.dart';
import 'package:hoppiez/presentation/widgets/bars.dart';

class HomeScreenController extends GetxController {

  RxString address = "Sector 28,Noida".obs;
  RxBool isCityAvailable = true.obs;


  final TextEditingController searchController = TextEditingController();
  final focusNode = FocusNode();
  final isFocused = false.obs;
  final isSearchEmpty = true.obs;

  Timer? debounce;


  RxString selectedPrice = "".obs;
  RxString selectedType = "".obs;
  RxString selectedSort = "".obs;
  RxString selectedStars = "".obs;
  RxBool isSearching = false.obs;
  RxDouble minPrice = 0.0.obs;
  RxDouble maxPrice = 6000.0.obs;

  RxList<String> selectedFilters = <String>[].obs;
  RxList<String> selectedAmenities = <String>[].obs;
  RxList<String> selectedCuisine = <String>[].obs;


  RxList<Restaurant> filteredRestaurants = <Restaurant>[].obs;


  final List<String> priceOptions = [
    "Under ₹1K",
    "Under ₹5K",
    "Under ₹10K",
    "₹10K or More",
  ];

  final List<String> typeOptions = ["Hotel", "Resort"];
  final List<String> starOptions = ["5", "4", "3", "2", "1"];

  final List<String> sortOptions = [
    "Price Low to High",
    "Price High to Low"
  ];

  final List<String> filterOptions = [
    "Available Today",
    "4+ Rating",
    "Within 5Km",
    "Hotels Only",
    "Pool",
  ];


  @override
  void onInit() {
    super.onInit();

    getLocationPermission();

    focusNode.addListener(() {
      isFocused.value = focusNode.hasFocus;
    });

    searchController.addListener(() {
      final value = searchController.text;
      isSearchEmpty.value = value.isEmpty;

      debounce?.cancel();
      debounce = Timer(const Duration(milliseconds: 300), () {
        applyFilters();
      });
    });

    applyFilters();
  }


  void applyFilters() {
    final all = List<Restaurant>.from(RestaurantStore.restaurants);


    String currentCity = "";
    if (address.value.contains(",")) {
      currentCity = address.value.split(",")[1].trim().toLowerCase();
    }

    final availableCities =
    RestaurantStore.cities.map((e) => e.toLowerCase()).toList();

    bool shouldApplyCityFilter = false;

    if (currentCity.isNotEmpty &&
        availableCities.contains(currentCity)) {
      isCityAvailable.value = true;
      shouldApplyCityFilter = true;
    } else {
      if (isCityAvailable.value == true) {

        Bars.showWarningBar(
          "Not Available",
          "We are not available in your city yet",
        );
      }
      isCityAvailable.value = false;
      shouldApplyCityFilter = false;
    }

    final query = searchController.text.toLowerCase();

    List<Restaurant> result = all.where((r) {

      final matchesCity = shouldApplyCityFilter
          ? r.city.toLowerCase().contains(currentCity)
          : true;


      final matchesSearch = query.isEmpty
          ? true
          : r.name.toLowerCase().contains(query) ||
          r.city.toLowerCase().contains(query) ||
          r.cuisines.any(
                  (c) => c.name.toLowerCase().contains(query));


      bool matchesPrice = true;
      if (selectedPrice.value.isNotEmpty) {
        final price = r.averagePricePerPerson * 2;

        switch (selectedPrice.value) {
          case "Under ₹1K":
            matchesPrice = price <= 1000;
            break;
          case "Under ₹5K":
            matchesPrice = price <= 5000;
            break;
          case "Under ₹10K":
            matchesPrice = price <= 10000;
            break;
          case "₹10K or More":
            matchesPrice = price > 10000;
            break;
        }
      }


      bool matchesType = true;
      if (selectedType.value == "Hotel") {
        matchesType = r.isHotel;
      } else if (selectedType.value == "Resort") {
        matchesType = !r.isHotel;
      }


      bool matchesRating = true;
      if (selectedStars.value.isNotEmpty) {
        final star = double.tryParse(selectedStars.value) ?? 0;
        matchesRating = r.rating >= star;
      }

      bool matchesAmenities = true;
      if (selectedAmenities.isNotEmpty) {
        final restaurantAmenities =
        r.facilities.map((f) => f.id.toLowerCase()).toList();

        matchesAmenities = selectedAmenities.every(
              (selected) =>
              restaurantAmenities.contains(selected.toLowerCase()),
        );
      }


      bool matchesCuisine = true;
      if (selectedCuisine.isNotEmpty) {
        final restaurantCuisines =
        r.cuisines.map((c) => c.id.toLowerCase()).toList();

        matchesCuisine = selectedCuisine.every(
              (selected) =>
              restaurantCuisines.contains(selected.toLowerCase()),
        );
      }

      bool matchesExtra = true;

      if (selectedFilters.contains("Available Today")) {
        matchesExtra &= r.availableToday;
      }

      if (selectedFilters.contains("4+ Rating")) {
        matchesExtra &= r.rating >= 4.0;
      }

      if (selectedFilters.contains("Hotels Only")) {
        matchesExtra &= r.isHotel;
      }

      if (selectedFilters.contains("Pool")) {
        matchesExtra &= r.hasPool;
      }

      return matchesCity &&
          matchesSearch &&
          matchesPrice &&
          matchesType &&
          matchesRating &&
          matchesCuisine && matchesAmenities &&
          matchesExtra;
    }).toList();


    if (selectedSort.value == "Price Low to High") {
      result.sort((a, b) =>
          a.averagePricePerPerson.compareTo(b.averagePricePerPerson));
    } else if (selectedSort.value == "Price High to Low") {
      result.sort((a, b) =>
          b.averagePricePerPerson.compareTo(a.averagePricePerPerson));
    }

    filteredRestaurants.assignAll(result);
  }

  // 🔹 Setters
  void setPrice(String value) {
    selectedPrice.value = value;
    applyFilters();
  }

  void setType(String value) {
    selectedType.value = value;
    applyFilters();
  }

  void setStar(String value) {
    selectedStars.value = value;
    applyFilters();
  }

  void setSort(String value) {
    selectedSort.value = value;
    applyFilters();
  }

  void toggleFilter(String value) {
    if (selectedFilters.contains(value)) {
      selectedFilters.remove(value);
    } else {
      selectedFilters.add(value);
    }
    applyFilters();
  }

  // 🔹 Clear
  void clearAll() {
    selectedPrice.value = "";
    selectedType.value = "";
    selectedSort.value = "";
    selectedStars.value = "";
    selectedFilters.clear();
    selectedAmenities.clear();
    selectedCuisine.clear();

    searchController.clear();
    applyFilters();
  }


  Future<void> getLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

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
      await fetchLocation();
    }
  }

  Future<void> fetchLocation() async {
    try {
      address.value = "Loading...., ";

      Position position = await Geolocator.getCurrentPosition();

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        String street = place.street ?? "";
        List<String> parts = street.split(" ");
        if (parts.length > 2) {
          street = "${parts[0]} ${parts[1]}";
        }

        String city =
            place.locality ?? place.subAdministrativeArea ?? "";

        address.value = "$street, $city";

        applyFilters();
      }
    } catch (e) {
      address.value = "Unable to fetch location";

      Bars.showWarningBar(
        "Location Error",
        e.toString(),
      );
    }
  }

  void goToMap(){
    Get.toNamed(Navigation.mapScreen);
  }


  @override
  void onClose() {
    debounce?.cancel();
    searchController.dispose();
    focusNode.dispose();
    super.onClose();
  }
}
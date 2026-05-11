import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/data/local/models/restaurant.dart';
import 'package:hoppiez/presentation/widgets/bars.dart';

class MapScreenController extends GetxController {
  final mapController = MapController();
late Restaurant? restaurant;
  final LatLng fallbackLocation = const LatLng(28.6139, 77.2090);

  Rx<LatLng> currentPosition = const LatLng(
    28.6139,
    77.2090,
  ).obs;
  Rx<LatLng> theMainRestaurant = const LatLng(
    28.6139,
    77.2090,
  ).obs;

  RxBool isLoading = true.obs;
  RxBool isMapReady = false.obs;


  RxList<Restaurant> restaurants = <Restaurant>[].obs;

  @override
  void onInit() {
    super.onInit();

    loadRestaurants();

    if (Get.arguments != null) {
      restaurant = Get.arguments as Restaurant;

      final lat = restaurant!.coordinates[0];
      final lng = restaurant!.coordinates[1];

      theMainRestaurant.value = LatLng(lat, lng);
    }

    getCurrentLocation();
  }

  void loadRestaurants() {
    final random = Random();
    int offset = random.nextInt(RestaurantStore.restaurants.length-5);
    restaurants.assignAll(RestaurantStore.restaurants.sublist(offset, offset +5));
  }

  void onMapReady() {
    isMapReady.value = true;

    mapController.move(currentPosition.value, 15);
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission =
      await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          _handleNoPermission();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        _handleNoPermission();
        return;
      }

      final pos = await Geolocator.getCurrentPosition();

      currentPosition.value = LatLng(
        pos.latitude,
        pos.longitude,
      );

      isLoading.value = false;

      onMapReady();

      if (isMapReady.value) {
        if (restaurant != null) {
          animateToLocation(
            theMainRestaurant.value,
            zoom: 17,
          );
        } else {
          animateToLocation(
            currentPosition.value,
          );
        }
      }
    } catch (e) {
      debugPrint(e.toString());

      Bars.showErrorBar(
        "Location Error",
        "Unable to fetch current location",
      );

      currentPosition.value = fallbackLocation;
      isLoading.value = false;
    }
  }

  Future<void> animateToLocation(
      LatLng dest, {
        double zoom = 15,
      }) async {
    final start = mapController.camera.center;
    final startZoom = mapController.camera.zoom;

    const duration = Duration(milliseconds: 500);
    const frame = Duration(milliseconds: 16);

    int steps =
        duration.inMilliseconds ~/ frame.inMilliseconds;

    for (int i = 0; i <= steps; i++) {
      final t = i / steps;
      final eased = Curves.easeInOut.transform(t);

      final lat =
      lerpDouble(start.latitude, dest.latitude, eased)!;

      final lng =
      lerpDouble(start.longitude, dest.longitude, eased)!;

      final z = lerpDouble(startZoom, zoom, eased)!;

      mapController.move(LatLng(lat, lng), z);

      await Future.delayed(frame);
    }
  }

  void focusRestaurant(Restaurant restaurant) {
    final lat = restaurant.coordinates[0];
    final lng = restaurant.coordinates[1];

    animateToLocation(
      LatLng(lat, lng),
      zoom: 17,
    );
  }

  void _handleNoPermission() {
    Bars.showErrorBar(
      "Permission Error",
      "Permission of location is not given",
    );

    currentPosition.value = fallbackLocation;
    isLoading.value = false;
  }
}
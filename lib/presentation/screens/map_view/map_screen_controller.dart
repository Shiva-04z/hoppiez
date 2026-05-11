import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:hoppiez/presentation/widgets/bars.dart';

class MapScreenController extends GetxController {

  final mapController = MapController();
  final LatLng fallbackLocation = const LatLng(28.6139, 77.2090);

  Rx<LatLng> currentPosition = const LatLng(28.6139, 77.2090).obs;
  RxBool isLoading = true.obs;
  RxBool isMapReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  void onMapReady() {
    isMapReady.value = true;

    // 🔥 only move ONCE
    mapController.move(currentPosition.value, 15);
  }

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();

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

      currentPosition.value = LatLng(pos.latitude, pos.longitude);
      isLoading.value = false;
      onMapReady();

      if (isMapReady.value) {
        animateToLocation(currentPosition.value);
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

  // 🔥 SAFE animation (no Ticker)
  Future<void> animateToLocation(LatLng dest, {double zoom = 15}) async {
    final start = mapController.camera.center;
    final startZoom = mapController.camera.zoom;

    const duration = Duration(milliseconds: 500);
    const frame = Duration(milliseconds: 16);

    int steps = duration.inMilliseconds ~/ frame.inMilliseconds;

    for (int i = 0; i <= steps; i++) {
      final t = i / steps;
      final eased = Curves.easeInOut.transform(t);

      final lat = lerpDouble(start.latitude, dest.latitude, eased)!;
      final lng = lerpDouble(start.longitude, dest.longitude, eased)!;
      final z = lerpDouble(startZoom, zoom, eased)!;

      mapController.move(LatLng(lat, lng), z);

      await Future.delayed(frame);
    }
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
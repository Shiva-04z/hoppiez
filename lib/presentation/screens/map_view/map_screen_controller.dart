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

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
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
      mapController.move(currentPosition.value, 15);

    } catch (e) {

      Bars.showErrorBar(
        "Location Error",
        "Unable to fetch current location",
      );

      currentPosition.value = fallbackLocation;
      isLoading.value = false;
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
import 'dart:math';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../data/local/dummy/restaurant_store.dart';
import '../../../data/local/models/restaurant.dart';

class RestaurantScreenController extends GetxController {
  late final Restaurant restaurant;
  late final List<Restaurant> restaurants;

  @override
  void onInit() {
    super.onInit();

    restaurant = Get.arguments as Restaurant;

    final random = Random();

    final offset = random.nextInt(
      RestaurantStore.restaurants.length - 5,
    );

    restaurants = RestaurantStore.restaurants
        .sublist(offset, offset + 5);
  }
}
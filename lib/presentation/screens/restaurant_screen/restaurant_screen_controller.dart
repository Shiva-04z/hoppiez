import 'package:get/get.dart';

import '../../../data/local/models/restaurant.dart';

class RestaurantScreenController extends GetxController{
  late Restaurant restaurant;

  @override
  void onInit() {
    // TODO: implement onInit
    restaurant = Get.arguments;
    super.onInit();

  }

}
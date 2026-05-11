import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';

class RestaurantScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestaurantScreenController());
  }
}

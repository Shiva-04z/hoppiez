import 'package:get/get.dart';
import 'package:hoppiez/core/navigation/navigation.dart';

import '../../../data/local/dummy/restaurant_store.dart';

class SplashScreenController extends GetxController {
  final String title = "Hoppiez";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigateToHome();
  }

  Future<void> _initializers() async {
    RestaurantStore.init();
  }

  void navigateToHome() async {
    await _initializers();
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(Navigation.homeScreen);
  }
}

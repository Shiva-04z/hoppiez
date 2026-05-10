import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/splash_screen/splash_screen_controller.dart';

class SplashScreenBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>SplashScreenController());
  }
}
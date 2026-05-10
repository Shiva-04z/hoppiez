import 'package:get/get.dart';
import 'package:hoppiez/core/navigation/navigation.dart';

class SplashScreenController extends GetxController{
final String title = "Hoppiez";
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    navigateToHome();
  }
  
  
  void navigateToHome()async{
  await Future.delayed(const Duration(seconds: 3));
  Get.offNamed(Navigation.homeScreen);
  }
}
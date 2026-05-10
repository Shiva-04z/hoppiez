import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_controller.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_service.dart';

class HomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>HomeScreenController());
    Get.lazyPut(()=>HomeScreenService());
  }
}

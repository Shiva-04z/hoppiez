import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/map_view/map_screen_controller.dart';

class MapScreenBindings extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>MapScreenController());
  }
}
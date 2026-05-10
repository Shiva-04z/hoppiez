import 'package:get/get.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_bindings.dart';
import 'package:hoppiez/presentation/screens/home_screen/home_screen_view.dart';
import 'package:hoppiez/presentation/screens/splash_screen/splash_screen_bindings.dart';
import 'package:hoppiez/presentation/screens/splash_screen/splash_screen_view.dart';

class Navigation {
  Navigation._();

  static const String splashScreen = "/splash_screen_view";
  static const String homeScreen = "/home_screen_view";

  static final List<GetPage> getPages = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreenView(),
      binding: SplashScreenBindings(),
    ), GetPage(
      name: homeScreen,
      page: () => HomeScreenView(),
      binding: HomeScreenBindings(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(microseconds: 200)
    ),
  ];
}

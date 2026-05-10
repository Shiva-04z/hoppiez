import 'dart:ui';

import 'package:get/get.dart';

class Bars {
  Bars._();

  static void showSuccessBar(String title, String? message) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message ?? "",
      backgroundColor: Color(0xFF00FF00),
      colorText: Color(0xFFFFFFFF),
    );
  }

  static void showWarningBar(String title, String? message) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message ?? "",
      backgroundColor: Color(0xFFFFFF00),
      colorText: Color(0xFFFFFFFF),
    );
  }

  static void showErrorBar(String title, String? message) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message ?? "",
      backgroundColor: Color(0xFFFF0000),
      colorText: Color(0xFFFFFFFF),
    );
  }



}

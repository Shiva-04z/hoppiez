import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hoppiez/core/navigation/navigation.dart';
import 'package:hoppiez/core/theme/app_theme.dart';

class DiningApp extends StatelessWidget {
  const DiningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:  AppTheme.appTheme,
      initialRoute: Navigation.splashScreen,
      debugShowCheckedModeBanner: false,
      getPages: Navigation.getPages,
    );
  }
}

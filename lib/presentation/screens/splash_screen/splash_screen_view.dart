import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/presentation/screens/splash_screen/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: FadeIn(
          duration: const Duration(seconds: 2),
          child: Text(
            controller.title,
            style: GoogleFonts.fraunces(
              fontSize: 53.25,
              color: Colors.red,
              fontWeight: .w800,
            ),
          ),
        ),
      ),
    );
  }
}

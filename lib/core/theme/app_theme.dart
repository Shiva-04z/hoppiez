import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFDF3F3),
    cardTheme: CardThemeData(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
      ),
    ),
    primaryTextTheme: GoogleFonts.poppinsTextTheme(),
  );
}

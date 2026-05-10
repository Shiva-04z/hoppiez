import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  
  AppTheme._();
  
static  final ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFE0E0),
  primaryTextTheme: GoogleFonts.poppinsTextTheme(),
  );
}
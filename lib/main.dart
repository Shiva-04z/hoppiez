import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/dining_app.dart';

void main() async {
  try {
    FlutterNativeSplash.remove();
    runApp(const DiningApp());
  } catch (e) {
    debugPrint(e.toString());
  }
}


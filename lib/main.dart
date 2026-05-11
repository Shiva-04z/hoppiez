import 'package:flutter/material.dart';
import 'package:hoppiez/data/local/dummy/restaurant_store.dart';
import 'package:hoppiez/dining_app.dart';

void main() async {
  try {
    runApp(const DiningApp());
  } catch (e) {
    debugPrint(e.toString());
  }
}


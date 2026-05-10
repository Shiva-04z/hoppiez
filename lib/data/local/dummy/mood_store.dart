import 'dart:ui';

import 'package:hoppiez/data/local/models/mood_category.dart';

class MoodStore {
  MoodStore._();

  static final List<MoodCategory> moods = [
    MoodCategory(
      name: "New in Town",
      image1: "assets/images/pizza.png",
      image2: "assets/images/champagne.png",
      splash: const Color(0xFFFFDFBE),
    ),
    MoodCategory(
      name: "North Indian",
      image1: "assets/images/north.png",
      splash: const Color(0xFFBEFFF0),
    ),  MoodCategory(
      name: "South Indian",
      image1: "assets/images/south.png",
      splash: const Color(0xFFF3BEFF),
    ),
    MoodCategory(
      name: "Regional",
      image1: "assets/images/pizza2.png",
      image2: "assets/images/champagne.png",
      splash: const Color(0xFFFFDFBE),
    ),
    MoodCategory(
      name: "Asian Cuisine",
      image1: "assets/images/pizza.png",
      image2: "assets/images/champagne.png",
      splash: const Color(0xFFFFDFBE),
    ),
    MoodCategory(
      name: "Global Cuisine",
      image1: "assets/images/north.png",
      splash: const Color(0xFFBEFFF0),
    ),
    MoodCategory(
      name: "Buffet",
      image1: "assets/images/south.png",
      splash: const Color(0xFFF3BEFF),
    ),
    MoodCategory(
      name: "Romantic",
      image1: "assets/images/pizza2.png",
      image2: "assets/images/champagne.png",
      splash: const Color(0xFFFFDFBE),
    ),
    MoodCategory(
      name: "Bar & Pubs",
      image1: "assets/images/pizza.png",
      image2: "assets/images/champagne.png",
      splash: const Color(0xFFFFDFBE),
    ),  MoodCategory(
      name: "Roof Top",
      image1: "assets/images/north.png",
      splash: const Color(0xFFBEFFF0),
    ),
    MoodCategory(
      name: "Al Fresco",
      image1: "assets/images/south.png",
      splash: const Color(0xFFF3BEFF),
    ),
    MoodCategory(
      name: "Hotel Dining",
      image1: "assets/images/pizza2.png",
      image2: "assets/images/champagne.png",
      splash: const Color(0xFFFFDFBE),
    ),
  ];

}

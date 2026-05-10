import 'dart:ui';

class MoodCategory {
  final String name;
  final String image1;
  final String? image2;
  final Color splash;

 const MoodCategory({
    required this.name,
    required this.image1,
    this.image2,
    required this.splash,
  });
}

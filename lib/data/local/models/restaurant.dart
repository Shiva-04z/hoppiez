import 'package:hoppiez/data/local/models/review.dart';

import 'cusine.dart';
import 'facility.dart';
import 'offer.dart';

class Restaurant {
  final String id;
  final String name;
  final String address;
  final String number;
  final List<double> coordinates;

  final List<Review> reviews;

  double rating;
  final String extra;

  final List<Facility> facilities;
  final List<Cuisine> cuisines;
  final List<Offer> offers;
  final List<String> menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.address,
    required this.number,
    required this.coordinates,
    required this.reviews,
    required this.facilities,
    required this.cuisines,
    required this.offers,
    required this.menus,
    this.extra = "",
    this.rating = 0.0,
  }) {
    updateRating();
  }

  void addReview(Review review) {
    reviews.add(review);
    updateRating();
  }

  void updateRating() {
    if (reviews.isEmpty) {
      rating = 0.0;
      return;
    }

    double total = 0.0;

    for (var review in reviews) {
      total += review.rating;
    }

    rating = total / reviews.length;
  }
}

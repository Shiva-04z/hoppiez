import 'dart:math';

import 'package:get/get.dart';
import 'package:hoppiez/data/local/models/restaurant.dart';
import 'package:hoppiez/data/local/models/cusine.dart';
import 'package:hoppiez/data/local/models/facility.dart';
import 'package:hoppiez/data/local/models/offer.dart';
import 'package:hoppiez/data/local/models/review.dart';

class RestaurantStore extends GetxController {
  final RxList<Restaurant> restaurants = <Restaurant>[].obs;

  final _random = Random();

  final List<String> _restaurantImages = [
    "assets/images/restaurents/restaurent1.webp",
    "assets/images/restaurents/restaurent2.webp",
    "assets/images/restaurents/restaurent3.webp",
    "assets/images/restaurents/restaurent4.webp",
    "assets/images/restaurents/restaurent5.webp",
    "assets/images/restaurents/restaurent6.webp",
  ];

  final List<String> _menuImages = [
    "assets/images/menus/menu1.webp",
    "assets/images/menus/menu2.webp",
    "assets/images/menus/menu3.webp",
  ];

  final List<String> _dishImages = [
    "assets/images/dishes/dish1.webp",
    "assets/images/dishes/dish2.webp",
    "assets/images/dishes/dish3.webp",
    "assets/images/dishes/dish4.webp",
    "assets/images/dishes/dish5.webp",
    "assets/images/dishes/dish6.webp",
  ];

  final List<String> _reviewerImages = [
    "assets/images/users/user1.webp",
    "assets/images/users/user2.webp",
    "assets/images/users/user3.webp",
    "assets/images/users/user4.webp",
    "assets/images/users/user5.webp",
  ];

  final List<String> _reviewerNames = [
    "Aman Sharma",
    "Priya Verma",
    "Rohit Singh",
    "Neha Kapoor",
    "Aditya Jain",
    "Simran Kaur",
    "Kunal Mehta",
    "Riya Das",
  ];

  final List<String> _reviewComments = [
    "Amazing food and ambience!",
    "Loved the desserts and service.",
    "Great place for family dinner.",
    "Food quality was excellent.",
    "Affordable and delicious meals.",
    "One of the best restaurants in town.",
    "Beautiful interiors and tasty dishes.",
    "Highly recommended for weekends.",
  ];

  final List<String> _cities = [
    "Delhi",
    "Noida",
    "Gurgaon",
    "Mumbai",
    "Pune",
    "Bangalore",
    "Hyderabad",
    "Jaipur",
  ];

  final List<String> _restaurantNames = [
    "Royal Spice",
    "Urban Tadka",
    "The Food Lounge",
    "Skyline Dine",
    "Flavours Hub",
    "Spice Affair",
    "Ocean Pearl",
    "The Big Grill",
    "Bistro Valley",
    "Saffron House",
    "Golden Fork",
    "Taste District",
    "Cloud Kitchen",
    "Night Bites",
    "Curry Kingdom",
    "Olive Gardenia",
    "Moonlight Cafe",
    "The Rustic Spoon",
    "Palm Resort Dine",
    "Velvet Table",
    "Café Monarch",
    "Spice Symphony",
    "Food Fiesta",
    "The Hungry Spot",
    "Blue Plate",
    "Sunset Resort",
    "Imperial Feast",
    "Masala Stories",
    "Epicure House",
    "Fusion Flames",
  ];

  final List<Cuisine> _allCuisines = [
    Cuisine(id: "north_indian", name: "North Indian"),
    Cuisine(id: "south_indian", name: "South Indian"),
    Cuisine(id: "chinese", name: "Chinese"),
    Cuisine(id: "italian", name: "Italian"),
    Cuisine(id: "thai", name: "Thai"),
    Cuisine(id: "mexican", name: "Mexican"),
  ];

  final List<Facility> _allFacilities = [
    Facility(id: "pool", name: "Pool"),
    Facility(id: "parking", name: "Parking"),
    Facility(id: "wifi", name: "Wifi"),
    Facility(id: "rooftop", name: "Rooftop"),
    Facility(id: "live_music", name: "Live Music"),
    Facility(id: "pet_friendly", name: "Pet Friendly"),
  ];

  final List<Offer> _offers = [
    Offer(
      offerDiscount: "20% OFF",
      offerTiming: "12 PM - 4 PM",
    ),
    Offer(
      offerDiscount: "Flat ₹500 OFF",
      offerTiming: "Weekend Special",
    ),
    Offer(
      offerDiscount: "Buy 1 Get 1",
      offerTiming: "Happy Hours",
    ),
    Offer(
      offerDiscount: "15% OFF",
      offerTiming: "Dinner Offer",
    ),
    Offer(
      offerDiscount: "30% OFF",
      offerTiming: "Lunch Buffet",
    ),
  ];

  @override
  void onInit() {
    super.onInit();

    generateRestaurants();
  }

  void generateRestaurants() {
    restaurants.value = List.generate(
      30,
          (index) => Restaurant(
        id: "rest_$index",

        name: _restaurantNames[index],

        description:
        "A premium dining experience with delicious food and ambience.",

        address:
        "Sector ${_random.nextInt(90) + 1}, ${_cities[_random.nextInt(_cities.length)]}",

        city: _cities[_random.nextInt(_cities.length)],

        phone:
        "98${_random.nextInt(99999999).toString().padLeft(8, '0')}",

        coordinates: [
          28.0 + _random.nextDouble(),
          77.0 + _random.nextDouble(),
        ],

        images: _getRandomImages(
          _restaurantImages,
          count: 3 + _random.nextInt(3),
        ),

        menus: _getRandomImages(
          _menuImages,
          count: 1 + _random.nextInt(3),
        ),

        cuisines: _getRandomCuisines(),

        facilities: _getRandomFacilities(),

        offers: _getRandomOffers(),

        reviews: _getRandomReviews(),

        averagePricePerPerson:
        (_random.nextInt(20) + 1) * 500,

        rating: double.parse(
          (3 + _random.nextDouble() * 2)
              .toStringAsFixed(1),
        ),

        isHotel: _random.nextBool(),

        hasPool: _random.nextBool(),

        availableToday: _random.nextBool(),

        isOpen: _random.nextBool(),
      ),
    );
  }

  List<String> _getRandomImages(
      List<String> source, {
        required int count,
      }) {
    final shuffled = List<String>.from(source)..shuffle();

    return shuffled.take(count).toList();
  }

  List<Cuisine> _getRandomCuisines() {
    final shuffled = List<Cuisine>.from(_allCuisines)..shuffle();

    return shuffled.take(1 + _random.nextInt(3)).toList();
  }

  List<Facility> _getRandomFacilities() {
    final shuffled = List<Facility>.from(_allFacilities)..shuffle();

    return shuffled.take(1 + _random.nextInt(4)).toList();
  }

  List<Offer> _getRandomOffers() {
    final shuffled = List<Offer>.from(_offers)..shuffle();

    return shuffled.take(1 + _random.nextInt(3)).toList();
  }

  List<Review> _getRandomReviews() {
    return List.generate(
      2 + _random.nextInt(4),
          (index) => Review(
        id: "review_$index",

        reviewerName:
        _reviewerNames[_random.nextInt(_reviewerNames.length)],

        reviewerImage:
        _reviewerImages[_random.nextInt(_reviewerImages.length)],

        rating: double.parse(
          (3 + _random.nextDouble() * 2)
              .toStringAsFixed(1),
        ),

        comment:
        _reviewComments[_random.nextInt(_reviewComments.length)],

        images: _getRandomImages(
          _dishImages,
          count: 1 + _random.nextInt(3),
        ),
      ),
    );
  }
}
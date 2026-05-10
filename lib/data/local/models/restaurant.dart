import 'package:hoppiez/data/local/models/cusine.dart';
import 'package:hoppiez/data/local/models/facility.dart';
import 'package:hoppiez/data/local/models/offer.dart';
import 'package:hoppiez/data/local/models/review.dart';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String address;
  final String city;
  final String phone;

  final List<double> coordinates;
  final List<String> images;

  final List<String> menus;

  final List<Cuisine> cuisines;
  final List<Facility> facilities;
  final List<Offer> offers;
  final List<Review> reviews;

  final int averagePricePerPerson;

  final bool isOpen;
  final bool availableToday;
  final bool isHotel;
  final bool hasPool;
  
  final double rating;

  const Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.city,
    required this.phone,
    required this.coordinates,
    required this.images,
    required this.menus,
    required this.cuisines,
    required this.facilities,
    required this.offers,
    required this.reviews,
    required this.averagePricePerPerson,
    required this.rating,

    this.isOpen = true,
    this.availableToday = true,
    this.isHotel = false,
    this.hasPool = false,
  });
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hoppiez/data/local/models/offer.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/restaurant_screen_controller.dart';
import 'package:hoppiez/presentation/screens/restaurant_screen/widgets/discount_card.dart';

class TicketShape extends StatelessWidget {
  const TicketShape({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RestaurantScreenController>();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          width: 300,
          height: 150,
          color: const Color(0xFFFFF2F3),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  spacing: 10,
                  children: [
                    const Expanded(child: Divider(indent: 10, endIndent: 10)),
                    SizedBox(
                      height: 18,
                      width: 20,
                      child: Image.asset("assets/icons/discount.png"),
                    ),
                    Text(
                      "OFFERS",
                      style: TextStyle(fontSize: 15, fontWeight: .w700),
                    ),
                    SizedBox(
                      height: 18,
                      width: 20,
                      child: Image.asset("assets/icons/discount.png"),
                    ),
                    const Expanded(child: Divider(indent: 10, endIndent: 10)),
                  ],
                ),
              ),
              SizedBox(
                height: 65,
                child: ListView.builder(
                  scrollDirection: .horizontal,
                  itemExtent: 140,
                  itemBuilder: (context, index) {
                    final Offer offer = controller.restaurant.offers[index];
                    return DiscountCard(
                      offer: offer,
                      key: ValueKey(offer.offerTiming),
                    );
                  },
                  itemCount: controller.restaurant.offers.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const double topRadius = 16.0;
    const double cutRadius = 8.0;
    const double spacing = 34.0;

    final double availableWidth = size.width;
    final int numberOfCircles = (availableWidth / spacing).floor();

    final double startX = size.width - (spacing * (numberOfCircles - 1));
    path.moveTo(topRadius, 0);

    path.lineTo(size.width - topRadius, 0);

    path.quadraticBezierTo(size.width, 0, size.width, topRadius);

    path.lineTo(size.width, size.height);
    double x = size.width;

    for (int i = 0; i < numberOfCircles + 1; i++) {
      final cutEndX = x - spacing;
      path.arcToPoint(
        Offset(cutEndX, size.height),
        radius: const Radius.circular(cutRadius),
        clockwise: false,
      );
      x = cutEndX;
    }

    path.lineTo(0, size.height);

    path.lineTo(0, topRadius);
    path.quadraticBezierTo(0, 0, topRadius, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

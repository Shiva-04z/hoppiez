import 'package:flutter/material.dart';
import 'package:hoppiez/data/local/models/offer.dart';

class DiscountCard extends StatelessWidget {
  final Offer offer;

  const DiscountCard({super.key, required this.offer});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFFFFFF),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade100),
      ),
      child: SizedBox(
        height: 60,
        width: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                offer.offerTiming,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF666666),
                  fontWeight: .w600,
                ),
              ),
              Row(
                children: [
                  RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      text: offer.offerDiscount,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: .w700,
                        color: Color(0xFFF12535),
                      ),
                      children: [
                        TextSpan(
                          text: " OFF",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFF12535),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

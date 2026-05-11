import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../data/local/models/review.dart';

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final day = random.nextInt(7);
    return Card(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(16),
        side: BorderSide(color: Color(0xFFD8D8D8)),
      ),
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 15,
          crossAxisAlignment: .start,
          mainAxisAlignment: .start,
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                spacing: 4,

                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Image.asset(review.reviewerImage),
                  ),
                  Text(
                    review.reviewerName,
                    style: TextStyle(color: Color(0xFF000000)),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(Icons.star, color: Color(0xFF166716)),
                  Text(review.rating.toStringAsFixed(1)),
                ],
              ),
            ),
            Text(
              review.comment,
              textAlign: TextAlign.justify,
              softWrap: true,
              style: TextStyle(fontSize: 12, color: Color(0xFF391818)),
            ),
            Text(
              "$day day's ago",
              style: TextStyle(fontSize: 10, color: Color(0xFF8D8D8D)),
            ),
            SingleChildScrollView(
              scrollDirection: .horizontal,
              child: Row(
            children: review.images
                .map(
                (i) => Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          i,
          width: 101,
          height: 100,
          fit: BoxFit.cover,
        ),
      ),
    ),
    )
        .toList(),
    ),
            ),
          ],
        ),
      ),
    );
  }
}

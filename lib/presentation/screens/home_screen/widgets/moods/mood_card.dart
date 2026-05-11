import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hoppiez/data/local/models/mood_category.dart';

class MoodCard extends StatelessWidget {
  final MoodCategory moodCategory;

  const MoodCard({super.key, required this.moodCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusGeometry.circular(16),
        border: Border.all(color: Colors.grey.shade300),
        gradient: LinearGradient(
          colors: [Colors.white, moodCategory.splash],
          begin: AlignmentGeometry.center,
          end: AlignmentGeometry.bottomLeft,
        ),
      ),
      child: Column(
        mainAxisAlignment: .start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 4),
            child: Text(
              moodCategory.name,
              textAlign: TextAlign.left,
              softWrap: true,
              style: GoogleFonts.inter(fontSize: 13, fontWeight: .w600),
            ),
          ),
          Row(),
          Expanded(child: SizedBox(height: 10)),
          Stack(
            alignment: .bottomEnd,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  moodCategory.image1,
                  fit: BoxFit.scaleDown,
                ),
              ),
              if (moodCategory.image2 != null)
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    moodCategory.image2!,
                    fit: BoxFit.scaleDown,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

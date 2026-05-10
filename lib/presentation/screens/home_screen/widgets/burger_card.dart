import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BurgerCard extends StatelessWidget {
  const BurgerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        color: const Color(0xFFFFC529),
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsetsGeometry.all(16),
          child: Row(
            children: [
              Flexible(
                flex: 4,
                child: Column(

                  crossAxisAlignment: .start,
                  mainAxisAlignment: .center,
                  children: [
                    const SizedBox(height: 10,),
                    Text(
                      "Good music and good food makes.",
                      softWrap: true,
                      style: GoogleFonts.righteous(fontSize: 18),
                    ),
                    const SizedBox(height: 1,),
                    Text(
                      "Virat Kohlis fav spot",
                      softWrap: true,
                      style: GoogleFonts.nunitoSans(fontSize: 14,fontWeight: .w600,color: const Color(0xAA1C212B)),
                    ),
                    const SizedBox(height: 3,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                      onPressed: (){},
                      child: Text("Reserve Table",style: GoogleFonts.nunitoSans(fontSize: 12,color: Colors.white,fontWeight: .bold),),
                    ),
                    const SizedBox(height: 5,)
                  ],
                ),
              ),
              const Flexible(
                flex: 3,
                child: Image(
                  image: AssetImage("assets/images/moods/burger.webp"),
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

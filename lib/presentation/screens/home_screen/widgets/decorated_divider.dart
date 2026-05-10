import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DecoratedDivider extends StatelessWidget {
  final String title;
  const DecoratedDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Expanded(child: Divider(
              indent: 3,
              endIndent: 1,
            )),
            Padding(
              padding: const EdgeInsetsGeometry.all(4),
              child: SvgPicture.asset("assets/icons/decoration.svg"),
            ),
            Text(title,style: GoogleFonts.inter(fontWeight: .w500,color:const Color(0xFF586C83),fontSize: 15),),
            Padding(
              padding: const EdgeInsetsGeometry.all(4),
              child: SvgPicture.asset("assets/icons/decoration.svg"),
            ),
            const Expanded(child: Divider(
              indent: 1,
              endIndent: 3,
            )),

          ],
        ),
      ),
    );
  }
}

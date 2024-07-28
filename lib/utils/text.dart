import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class modifiedText extends StatelessWidget {
  const modifiedText(
      {super.key,  required this.text,  required this.size,  required this.color});
  final String text;
  final Color color;
  final double size;


  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.breeSerif(color: color, fontSize: size));
  }
}

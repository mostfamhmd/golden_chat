// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextComponent extends StatelessWidget {
  TextComponent(
      {Key? key,
      required this.text,
      required this.color,
      required this.size,
      this.fonts,
      this.isbold})
      : super(key: key);

  final String text;
  String? fonts;
  final Color color;
  final double size;
  bool? isbold = false;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.getFont(fonts ?? "Roboto").copyWith(
        color: color,
        fontSize: size,
        fontWeight: isbold == true ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}

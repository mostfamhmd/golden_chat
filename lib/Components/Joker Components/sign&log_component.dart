import 'package:flutter/material.dart';
import 'package:golden_chat/Components/Joker%20Components/height&width.dart';
import 'package:golden_chat/Components/Joker%20Components/text_component.dart';

// ignore: must_be_immutable
class EntryButton extends StatelessWidget {
  EntryButton({super.key, this.onTap, required this.signLogin});
  final String signLogin;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: dimensions.sizeHeight * 50 / Sized.height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Align(
          alignment: Alignment.center,
          child: TextComponent(text: signLogin, color: Colors.black, size: 15),
        ),
      ),
    );
  }
}

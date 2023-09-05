import 'package:flutter/material.dart';
import 'package:golden_chat/Components/Joker%20Components/text_component.dart';

void showSnakbar(BuildContext context, String condition) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: TextComponent(
        text: condition,
        color: Colors.white,
        size: 15,
      ),
    ),
  );
}

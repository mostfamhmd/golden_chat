// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golden_chat/Components/Joker%20Components/constants_file.dart';
import 'package:golden_chat/Components/Joker%20Components/height&width.dart';

class TextFieldMessage extends StatefulWidget {
  TextFieldMessage({super.key, this.scrollController, required this.name});
  ScrollController? scrollController;
  final String name;
  @override
  State<TextFieldMessage> createState() => _TextFieldMessageState();
}

class _TextFieldMessageState extends State<TextFieldMessage> {
  String? message;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: dimensions.sizeHeight * 10 / Sized.height,
          horizontal: dimensions.sizeWidth * 10 / Sized.width),
      child: TextField(
        controller: controller,
        onChanged: (data) {
          message = data;
        },
        style: const TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                messages.add({
                  "message": message,
                  "CreatedAt": DateTime.now(),
                  "id": widget.name
                });
                controller.clear();
                widget.scrollController?.animateTo(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                );
              },
              child: const Icon(Icons.send)),
          suffixIconColor: kprimaryColor,
          hintText: "Send Message",
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: kprimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}

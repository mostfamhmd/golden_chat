// ignore_for_file: must_be_immutable

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:golden_chat/Components/Joker%20Components/constants_file.dart';
import 'package:golden_chat/Model/message_model.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.message,
  });
  final Message message;

  @override
  Widget build(BuildContext context) {
    return BubbleSpecialThree(
      isSender: false,
      text: message.message,
      color: kprimaryColor,
      tail: true,
      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}

class ChatBubbleForFriend extends StatelessWidget {
  const ChatBubbleForFriend(
      {super.key, required this.message, required this.name});
  final Message message;
  final String name;
  @override
  Widget build(BuildContext context) {
    String getName() {
      String userName = '';
      for (int i = 0; i < name.length; i++) {
        if (name[i] != '@') {
          userName += name[i];
        } else {
          break;
        }
      }
      return userName;
    }

    return BubbleSpecialThree(
      isSender: true,
      text: "${getName()} : ${message.message}",
      color: const Color(0xFF898121),
      tail: true,
      textStyle: const TextStyle(color: Colors.white, fontSize: 16),
    );
  }
}

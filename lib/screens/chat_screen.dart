// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:golden_chat/Components/Chat%20Components/chat_bubble_component.dart';
import 'package:golden_chat/Components/Chat%20Components/text_field_message.dart';
import 'package:golden_chat/Components/Joker%20Components/constants_file.dart';
import 'package:golden_chat/Components/Joker%20Components/height&width.dart';
import 'package:golden_chat/Components/Joker%20Components/text_component.dart';
import 'package:golden_chat/Model/message_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  static String id = "ChatScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  CollectionReference messages =
      FirebaseFirestore.instance.collection('messages');
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String name = ModalRoute.of(context)!.settings.arguments as String;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy("CreatedAt", descending: true).snapshots(),
        builder: (context, Snapshot) {
          if (Snapshot.hasData) {
            List<Message> messageList = [];
            for (int i = 0; i < Snapshot.data!.docs.length; i++) {
              messageList.add(Message.fromJson(Snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kprimaryColor,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Logo.png",
                      height: dimensions.sizeHeight * 50 / Sized.height,
                      width: dimensions.sizeWidth * 50 / Sized.width,
                    ),
                    TextComponent(
                        text: "  Chat", color: Colors.white, size: 20),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: scrollController,
                        itemCount: messageList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: dimensions.sizeHeight *
                                      10 /
                                      Sized.height),
                              child: messageList[index].name == name
                                  ? ChatBubble(
                                      message: messageList[index],
                                    )
                                  : ChatBubbleForFriend(
                                      message: messageList[index],
                                      name: messageList[index].name,
                                    ));
                        }),
                  ),
                  TextFieldMessage(
                    name: name,
                    scrollController: scrollController,
                  ),
                ],
              ),
            );
          } else {
            return TextComponent(
                text: "Leading", color: Colors.black, size: 20);
          }
        });
  }
}

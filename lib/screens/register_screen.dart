// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:golden_chat/Components/Joker%20Components/height&width.dart';
import 'package:golden_chat/Components/Joker%20Components/sign&log_component.dart';
import 'package:golden_chat/Components/Joker%20Components/snakbar_method.dart';
import 'package:golden_chat/Components/Joker%20Components/text_component.dart';
import 'package:golden_chat/Components/Joker%20Components/text_field_component.dart';
import 'package:golden_chat/Components/Register%20Components/register_user_credential_method.dart';
import 'package:golden_chat/Components/Joker%20Components/constants_file.dart';
import 'package:golden_chat/screens/chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String id = "RegisterScreen";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    HeightWidth dimensions = HeightWidth(screenHeight, screenWidth);

    return ModalProgressHUD(
      color: Colors.white,
      inAsyncCall: isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kprimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimensions.sizeWidth * 10 / Sized.width,
          ),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  "assets/images/Logo.png",
                  height: dimensions.sizeHeight * 100 / Sized.height,
                  width: dimensions.sizeWidth * 100 / Sized.width,
                ),
                TextComponent(
                    fonts: "Pacifico",
                    text: "Golden Chat",
                    color: Colors.white,
                    size: 35),
                const Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    TextComponent(
                        text: "Register", color: Colors.white, size: 25),
                  ],
                ),
                SizedBox(
                  height: dimensions.sizeHeight * 15 / Sized.height,
                ),
                TextFormFieldComponent(
                  onChanged: (data) {
                    email = data;
                  },
                  hintext: "Email",
                ),
                SizedBox(
                  height: dimensions.sizeHeight * 10 / Sized.height,
                ),
                TextFormFieldComponent(
                  onChanged: (data) {
                    password = data;
                  },
                  hintext: "Password",
                ),
                SizedBox(
                  height: dimensions.sizeHeight * 15 / Sized.height,
                ),
                EntryButton(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      isLoading = true;
                      setState(() {});
                      try {
                        await RegisterComponent(email!, password!);

                        Navigator.pushNamed(
                          context,
                          ChatScreen.id,
                          arguments: email,
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weak-password') {
                          showSnakbar(context, 'weak password');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnakbar(context, 'email already exists');
                        }
                      } catch (ex) {
                        showSnakbar(context, ex.toString());
                      }

                      isLoading = false;
                      setState(() {});
                    } else {}
                  },
                  signLogin: 'Register',
                ),
                SizedBox(
                  height: dimensions.sizeHeight * 10 / Sized.height,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextComponent(
                        text: "Already have an account?  ",
                        color: Colors.white,
                        size: 15),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: TextComponent(
                            text: "LogIn", color: Colors.black, size: 15)),
                  ],
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

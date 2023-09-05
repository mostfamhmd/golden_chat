import 'package:flutter/material.dart';
import 'package:golden_chat/screens/chat_screen.dart';
import 'package:golden_chat/screens/login_screen.dart';
import 'package:golden_chat/screens/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LogInScreen.id: (context) => const LogInScreen(),
        RegisterScreen.id: (context) => const RegisterScreen(),
        ChatScreen.id: (context) => const ChatScreen(),
      },
      initialRoute: LogInScreen.id,
      debugShowCheckedModeBanner: false,
    );
  }
}

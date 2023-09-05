// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';

Future<void> RegisterComponent(String email, String password) async {
  var auth = FirebaseAuth.instance;
  // ignore: unused_local_variable
  UserCredential user = await auth.createUserWithEmailAndPassword(
      email: email, password: password);
}

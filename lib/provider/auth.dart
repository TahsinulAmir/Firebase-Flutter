import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth with ChangeNotifier {
  // Create authentication
  var auth = FirebaseAuth.instance;

  // Decalare to save setiap perubahan login/regist
  Stream<User?> changeState() {
    return auth.authStateChanges();
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  void logOut() async {
    await auth.signOut();
  }

  void register() async {}
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth with ChangeNotifier {
  // Create authentication
  var auth = FirebaseAuth.instance;

  // Decalare to save setiap perubahan login/regist
  Stream<User?> changeState() {
    return auth.idTokenChanges();
  }

  // Func sign in with google account
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // membutuhkan email
  void resetPassword(String email) async {
    // jika email tidak kosong
    if (email != "") {
      // maka jalankan ini
      await auth.sendPasswordResetEmail(email: email);
    }
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

  // Membutuhkah parameter email dan password seperti login
  void register(String email, String password) async {
    try {
      final userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}

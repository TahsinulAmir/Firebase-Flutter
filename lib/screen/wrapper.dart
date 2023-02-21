import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseflutter/provider/auth.dart';
import 'package:firebaseflutter/screen/login_screen.dart';
import 'package:firebaseflutter/screen/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    // call provider Auth
    Auth auth = Provider.of<Auth>(context);
    return StreamBuilder<User?>(
      stream: auth.changeState(),
      builder: (context, snapshot) {
        // Perbandingan
        if (snapshot.connectionState == ConnectionState.active) {
          return (snapshot.data != null) ? UserScreen() : LoginScreen();
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

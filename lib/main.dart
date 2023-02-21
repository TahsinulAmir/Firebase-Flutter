import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseflutter/provider/users.dart';
import 'package:firebaseflutter/screen/login_screen.dart';
import 'package:firebaseflutter/screen/register_screen.dart';
import 'package:firebaseflutter/screen/upload_screen.dart';
import 'package:firebaseflutter/screen/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'provider/storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Users(),
          ),
          ChangeNotifierProvider(
            create: (context) => Storage(),
          ),
        ],
        child: RegisterScreen(),
      ),
    );
  }
}

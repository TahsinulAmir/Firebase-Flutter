import 'package:firebaseflutter/provider/auth.dart';
import 'package:firebaseflutter/screen/register_screen.dart';
import 'package:firebaseflutter/screen/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passwordCtrl = TextEditingController();
    // call provider Auth
    Auth auth = Provider.of<Auth>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordCtrl,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    auth.login(emailCtrl.text, passwordCtrl.text);
                  },
                  child: Text("Login"),
                ),
                SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => Auth(),
                          child: RegisterScreen(),
                        ),
                      ),
                    );
                  },
                  child: Text("Register"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => Auth(),
                          child: ResetPassword(),
                        ),
                      ),
                    );
                  },
                  child: Text("Reset Password"),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                auth.signInWithGoogle();
              },
              child: Text("Sign In with Google Account"),
            ),
          ],
        ),
      ),
    );
  }
}

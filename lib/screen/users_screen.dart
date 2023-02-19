import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseflutter/provider/users.dart';
import 'package:firebaseflutter/screen/add_users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (context) => Users(),
                child: AddUsers(),
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: FutureBuilder<QuerySnapshot<Object?>>(
          future: users.getUsers(),
          builder: (context, snapshot) {
            print(snapshot.data!.docs[2].data());
            return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Name"),
                  subtitle: Text("Age : 20"),
                );
              },
            );
          }),
    );
  }
}

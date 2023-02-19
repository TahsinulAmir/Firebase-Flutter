import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseflutter/provider/users.dart';
import 'package:firebaseflutter/screen/add_users.dart';
import 'package:firebaseflutter/screen/edit_users.dart';
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
      body: StreamBuilder<QuerySnapshot<Object?>>(
        stream: users.streamUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final user = data[index].data() as Map<String, dynamic>;
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChangeNotifierProvider(
                          create: (context) => Users(),
                          child: EditUsers(),
                        ),
                      ),
                    );
                  },
                  title: Text('${user['firstname']} ${user['lastname']}'),
                  subtitle: Text("Age : ${user['age']}"),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

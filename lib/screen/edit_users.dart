import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseflutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditUsers extends StatelessWidget {
  EditUsers({super.key, required this.idDoc});
  String idDoc;

  @override
  Widget build(BuildContext context) {
    Users users = Provider.of<Users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Users"),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: users.getUserByIdDoc(idDoc),
          builder: (context, snapshot) {
            final data = snapshot.data!.data();
            print(data);
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
                    controller: users.firstnameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: users.lastnameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: users.ageCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Edit User'),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

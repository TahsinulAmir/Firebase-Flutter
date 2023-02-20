import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  TextEditingController firstnameCtrl = TextEditingController();
  TextEditingController lastnameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  final db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getUserByIdDoc(String id) {
    // Need DocummnetREference to get data
    DocumentReference docRef = db.collection("users").doc(id);
    return docRef.get();
  }

  void updateUser(String id) {
    // Need DocummnetREference to update data
    DocumentReference docRef = db.collection("users").doc(id);
    docRef.update({
      'firstname': firstnameCtrl.text,
      'lastname': lastnameCtrl.text,
      'age': ageCtrl.text,
    });
  }

  void addUser() {
    if (firstnameCtrl.text.isNotEmpty &&
        lastnameCtrl.text.isNotEmpty &&
        ageCtrl.text.isNotEmpty) {
      // Need CollectionReference
      CollectionReference users = db.collection("users");
      users.add(
        {
          'firstname': firstnameCtrl.text,
          'lastname': lastnameCtrl.text,
          'age': ageCtrl.text,
        },
      );
      firstnameCtrl.clear();
      lastnameCtrl.clear();
      ageCtrl.clear();
    } else {
      print("Salah Satu Data Kosong");
    }
  }

  // Future<QuerySnapshot<Object?>> getUsers() async {
  //   CollectionReference users = db.collection("users");

  //   return await users.get();
  // }

  Stream<QuerySnapshot<Object?>> streamUsers() {
    CollectionReference users = db.collection("users");
    return users.snapshots();
  }
}

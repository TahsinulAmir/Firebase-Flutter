import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  TextEditingController firstnameCtrl = TextEditingController();
  TextEditingController lastnameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  final db = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getUserByIdDoc(String id) {
    DocumentReference docRef = db.collection("users").doc(id);
    return docRef.get();
  }

  void addUser() {
    if (firstnameCtrl.text.isNotEmpty &&
        lastnameCtrl.text.isNotEmpty &&
        ageCtrl.text.isNotEmpty) {
      CollectionReference users = db.collection("users");
      users.add({
        'firstname': firstnameCtrl.text,
        'lastname': lastnameCtrl.text,
        'age': ageCtrl.text,
      });
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

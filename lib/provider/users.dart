import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  TextEditingController firstnameCtrl = TextEditingController();
  TextEditingController lastnameCtrl = TextEditingController();
  TextEditingController ageCtrl = TextEditingController();

  final db = FirebaseFirestore.instance;

  void addUser() {
    CollectionReference users = db.collection("users");
    users.add({
      'firstname': firstnameCtrl.text,
      'lastname': lastnameCtrl.text,
      'age': ageCtrl.text,
    });
    firstnameCtrl.clear();
    lastnameCtrl.clear();
    ageCtrl.clear();
  }
}

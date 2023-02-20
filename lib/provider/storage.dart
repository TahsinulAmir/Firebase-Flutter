import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage with ChangeNotifier {
  void UploadFile() async {
    // Multiple Upload
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      // Looping
      for (var element in result.files) {
        // Get name file
        String name = element.name;
        // Get File
        File file = File(element.path!);

        // Upload to firebase
        try {
          await FirebaseStorage.instance.ref(name).putFile(file);
        } on firebase_storage.FirebaseException catch (e) {
          print(e);
        }
      }
    } else {
      print("Cancel");
    }
  }
}

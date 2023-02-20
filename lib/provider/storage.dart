import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Storage with ChangeNotifier {
  void UploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Mendapatkan file
      File file = File(result.files.single.path!);

      // Upload file ke firebase
      try {
        await FirebaseStorage.instance
            .ref(result.files.single.name)
            .putFile(file);
      } on firebase_storage.FirebaseException catch (e) {
        print(e);
      }
    } else {
      // User canceled the picker
      print("Cancel");
    }
  }
}

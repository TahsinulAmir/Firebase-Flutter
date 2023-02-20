import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:firebaseflutter/provider/storage.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Storage storage = Provider.of<Storage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload File"),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            storage.UploadFile();
          },
          child: Text("Upload"),
        ),
      ),
    );
  }
}

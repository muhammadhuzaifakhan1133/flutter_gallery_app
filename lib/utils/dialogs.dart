import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static errorDialog({required String message}) {
  Get.dialog(AlertDialog(
    title: const Text("Error"),
    content: Text(message),
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Ok"))
    ],
  ));
}
}
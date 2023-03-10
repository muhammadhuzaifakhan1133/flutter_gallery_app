  import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar albumPhotoAppbar(String title) {
    return AppBar(
        title: Text(title, style: const TextStyle(color: Colors.black)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      );
  }
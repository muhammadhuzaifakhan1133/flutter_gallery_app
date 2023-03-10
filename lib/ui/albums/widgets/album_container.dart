import 'package:flutter/material.dart';
import 'package:gallery_app/ui/albums/albums_controller.dart';
import 'package:gallery_app/utils/images.dart';
import 'package:get/get.dart';

InkWell albumContainer(AlbumsController controller, int index) {
  return InkWell(
    onTap: () {
      controller.navigateToAlbumPhotosView(controller.albums[index]);
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: controller.isGridView ? Get.width * 0.4 : double.infinity,
      decoration: BoxDecoration(
          color: Colors.black,
          image:  DecorationImage(
              image: AssetImage(Images.albumBg),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(controller.albums[index].title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: controller.isGridView ? 18 : 24)),
        ],
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:gallery_app/models/album_model.dart';
import 'package:gallery_app/ui/album_photos/album_photos_controller.dart';
import 'package:gallery_app/ui/album_photos/widget/album_photo_appbar.dart';
import 'package:gallery_app/ui/album_photos/widget/album_photo_container.dart';
import 'package:get/get.dart';

class AlbumPhotos extends StatelessWidget {
  final AlbumModel album;
  const AlbumPhotos({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: albumPhotoAppbar(album.title),
        body: GetBuilder(
            init: AlbumPhotosController(albumId: album.id),
            builder: (controller) => controller.isDatafetch
                ? GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(controller.photos.length, (index) {
                      return albumPhotoContainer(controller, index);
                    }),
                  )
                : const Center(child: CircularProgressIndicator())));
  }


}

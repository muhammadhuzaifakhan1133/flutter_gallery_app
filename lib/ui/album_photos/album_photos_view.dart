import 'package:flutter/material.dart';
import 'package:gallery_app/models/album_model.dart';
import 'package:gallery_app/ui/album_photos/album_photos_controller.dart';
import 'package:get/get.dart';

class AlbumPhotos extends StatelessWidget {
  final AlbumModel album;
  const AlbumPhotos({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(album.title, style: const TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
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
                      return InkWell(
                        onTap: () {
                          controller.navigateToAlbumPhotoDetailView(
                              controller.photos[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.photos[index].thumbnailUrl),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      );
                    }),
                  )
                : const Center(child: CircularProgressIndicator())));
  }
}

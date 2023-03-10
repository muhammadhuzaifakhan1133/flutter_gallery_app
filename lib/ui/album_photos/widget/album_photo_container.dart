 import 'package:flutter/material.dart';
import 'package:gallery_app/ui/album_photos/album_photos_controller.dart';

InkWell albumPhotoContainer(AlbumPhotosController controller, int index) {
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
  }
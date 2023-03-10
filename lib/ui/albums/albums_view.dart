import 'package:flutter/material.dart';
import 'package:gallery_app/ui/albums/albums_controller.dart';
import 'package:gallery_app/ui/albums/widgets/album_appbar.dart';
import 'package:gallery_app/ui/albums/widgets/album_container.dart';
import 'package:get/get.dart';

class AlbumsView extends StatelessWidget {
  const AlbumsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AlbumsController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: albumAppbar(controller),
              body: controller.isDatafetch
                  ? GridView.count(
                      crossAxisCount: controller.isGridView ? 2 : 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      shrinkWrap: true,
                      childAspectRatio: controller.isGridView ? 1 : 2,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(15),
                      children: List.generate(
                        controller.albums.length,
                        (index) {
                          return albumContainer(controller, index);
                        },
                      ))
                  : const Center(child: CircularProgressIndicator()));
        });
  }
}

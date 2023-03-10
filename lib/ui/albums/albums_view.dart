import 'package:flutter/material.dart';
import 'package:gallery_app/ui/albums/albums_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: AlbumsController(),
        builder: (controller) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.black,
                elevation: 0,
                title: const Text('Albums',
                    style: TextStyle(color: Colors.white, fontSize: 24)),
              ),
              drawer: const Drawer(),
              body: controller.isDatafetch
                  ? ListView.builder(
                      itemCount: controller.albums.length,
                      padding: const EdgeInsets.all(15),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            controller.navigateToAlbumPhotosView(
                                controller.albums[index]);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(10),
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/album_bg.jpg"),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.albums[index].title,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 24)),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(child: CircularProgressIndicator()));
        });
  }
}

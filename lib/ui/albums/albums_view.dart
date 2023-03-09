import 'package:flutter/material.dart';
import 'package:gallery_app/ui/albums/albums_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('Albums',
              style: TextStyle(color: Colors.black, fontSize: 24)),
        ),
        body: GetBuilder(
            init: AlbumsController(),
            builder: (controller) => controller.isDatafetch
                ? ListView.builder(
                    itemCount: controller.albums.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(controller.albums[index].title),
                      );
                    },
                  )
                : const Center(child: CircularProgressIndicator())));
  }
}

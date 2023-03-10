import 'package:flutter/material.dart';
import 'package:gallery_app/ui/albums/albums_controller.dart';

AppBar albumAppbar(AlbumsController controller) {
  return AppBar(
    backgroundColor: Colors.black,
    elevation: 0,
    title: const Text('Albums',
        style: TextStyle(color: Colors.white, fontSize: 24)),
    actions: [
      IconButton(
        onPressed: () {
          controller.isGridView = !controller.isGridView;
          controller.update();
        },
        icon: Icon(
            controller.isGridView ? Icons.view_agenda : Icons.grid_view_rounded,
            color: Colors.white),
      )
    ],
  );
}

import 'package:gallery_app/models/album_model.dart';
import 'package:gallery_app/services/album_services.dart';
import 'package:get/get.dart';

class AlbumsController extends GetxController {
  bool isDatafetch = false;
  List<AlbumModel> albums = [];
  final AlbumServices _albumServices = AlbumServices();

  @override
  void onInit() {
    super.onInit();
    _albumServices.getAlbums().then((value) {
      albums = value;
      
      isDatafetch = true;
      update();
    });
  }
}

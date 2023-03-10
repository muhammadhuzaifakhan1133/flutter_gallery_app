import 'package:gallery_app/models/album_photo_model.dart';
import 'package:gallery_app/services/album_services.dart';
import 'package:gallery_app/ui/album_photo_detail/album_photo_detail_view.dart';
import 'package:get/get.dart';

class AlbumPhotosController extends GetxController {
  final int albumId;
  AlbumPhotosController({required this.albumId});
  List<AlbumPhotoModel> photos = [];
  bool isDatafetch = false;
  final AlbumServices _albumServices = AlbumServices();

  @override
  onInit() {
    super.onInit();
    _albumServices.getSpecificAlbumPhotos(albumId: albumId).then((value) {
      photos = value;
      isDatafetch = true;
      update();
    });
  }

  void navigateToAlbumPhotoDetailView(AlbumPhotoModel photo) {
    Get.to(() => AlbumPhotoDetailView(imageUrl: photo.url));
  }
}

import 'package:gallery_app/models/album_model.dart';
import 'package:gallery_app/models/album_photo_model.dart';
import 'package:gallery_app/network/api_client.dart';
import 'package:gallery_app/utils/api_constants.dart';

class AlbumServices {
  final ApiClient _apiClient = ApiClient();
  Future<List<AlbumModel>> getAlbums() async {
    final response = await _apiClient.getData(endpoint: ApiConstants.albums);
    List<AlbumModel> albums = [];
    for (var item in response) {
      albums.add(AlbumModel.fromJson(item));
    }
    return albums;
  }

  Future<List<AlbumPhotoModel>> getSpecificAlbumPhotos({required int albumId}) async {
    final response = await _apiClient.getData(
        endpoint: ApiConstants.albumPhotos, queryParameters: {"albumId": "$albumId"});
    List<AlbumPhotoModel> albumPhotos = [];
    for (var item in response) {
      albumPhotos.add(AlbumPhotoModel.fromJson(item));
    }
    return albumPhotos;
  }
}
class AlbumModel {
  int id;
  int userId;
  String title;

  AlbumModel({required this.id, required this.userId, required this.title});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        id: json['id'], userId: json['userId'], title: json['title']);
  }
}
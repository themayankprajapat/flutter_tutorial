class PhotoModel {
  final String id;
  final String author;
  final String pic;

  PhotoModel({required this.id, required this.author, required this.pic});

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      id: json['id'],
      author: json['author'],
      pic: json['download_url'],
    );
  }
}

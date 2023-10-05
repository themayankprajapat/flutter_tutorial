class TodoModel {
  final int id;
  final String title;
  final String body;

  TodoModel({required this.id, required this.title, required this.body});

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'body': body};
  }
}

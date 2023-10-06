import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 1)
class Todo {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String body;

  Todo({required this.id, required this.title, required this.body});
}

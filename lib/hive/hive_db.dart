import 'package:flutter/foundation.dart';
import 'package:flutter_tutorial/hive/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';

const boxName = 'todoBox';

class HiveDB {
  HiveDB._();

  static final instance = HiveDB._();

  static Box? _box;

  Box get box {
    if (_box != null) return _box!;
    _box = initBox();
    return _box!;
  }

  Box initBox() => Hive.box(boxName);

  void createTodo(Todo todo) {
    box.add(todo);
  }

  void updateTodo(int index, Todo todo) {
    box.putAt(index, todo);
  }

  void deleteTodo(int index) {
    box.deleteAt(index);
  }

  ValueListenable<Box<dynamic>> getAll() {
    return box.listenable();
  }

  Todo getTodo(int index) {
    return box.getAt(index);
  }
}

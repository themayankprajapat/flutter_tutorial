import 'package:flutter_tutorial/todo_app/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static const _dbName = 'todo.db';
  static const _tableName = 'todo';
  static const _version = 1;
  DBHelper._();

  static final instance = DBHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await openDB();
    return _database!;
  }

  static Database? _database;

  Future<Database> openDB() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, body TEXT)',
        );
      },
      version: _version,
    );

    return database;
  }

  Future<void> createTodo(TodoModel model) async {
    final db = await database;

    await db.insert(
      _tableName,
      model.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<TodoModel>> getTodos(int limit, int offset) async {
    final db = await database;

    final List<Map<String, dynamic>> maps =
        await db.query(_tableName, limit: limit, offset: offset);

    return List.generate(maps.length, (i) => TodoModel.fromJson(maps[i]));
  }

  Future<void> update(TodoModel todo) async {
    final db = await database;

    await db.update(
      _tableName,
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<void> delete(TodoModel todo) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }
}

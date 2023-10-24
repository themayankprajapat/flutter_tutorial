part of 'todo_bloc.dart';

abstract class TodoEvent {}

class TodoAdd extends TodoEvent {
  final TodoModel model;

  TodoAdd({required this.model});
}

class TodoGet extends TodoEvent {}

class TodoDelete extends TodoEvent {
  final String id;

  TodoDelete({required this.id});
}

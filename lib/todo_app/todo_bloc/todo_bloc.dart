import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tutorial/api_service/firebasea_api.dart';
import 'package:flutter_tutorial/todo_app/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInit()) {
    on((event, emit) async {
      if (event is TodoGet) {
        await FireBaseApi.instance.getTodo().then((value) {
          List<TodoModel> tempData = List.from(
            value.map((e) => TodoModel.fromJson(e.data())),
          );
          emit(TodoFetched(list: tempData));
        });
      } else if (event is TodoAdd) {
        await FireBaseApi.instance.createTodo(event.model).then((value) {
          emit(TodoAddState(success: value));
          add(TodoGet());
        });
      } else if (event is TodoDelete) {
        await FireBaseApi.instance.deleteTodo(event.id).then((value) {
          emit(TodoDeleteState(success: value));
          add(TodoGet());
        });
      }
    });
  }
}

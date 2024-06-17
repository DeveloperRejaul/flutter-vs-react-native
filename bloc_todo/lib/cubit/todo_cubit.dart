import 'package:bloc_todo/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    // checking input data
    if (title.isEmpty) {
      return addError("Tile title is empty");
    }

    final todo = Todo(name: title, createdAt: DateTime.now());

    emit([...state, todo]);
  }

  // observes state all of this
  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print('TodoCubit - $change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print('TodoCubit - $error');
  }
}

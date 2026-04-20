import 'package:Flutter_Riverpod/todo/ToDoModel.dart';
import 'package:flutter_riverpod/legacy.dart';

final todoProvider = StateNotifierProvider<ToDoNotifier, List<TodoModel>>((_) {
  return ToDoNotifier([]);
});

class ToDoNotifier extends StateNotifier<List<TodoModel>> {
  ToDoNotifier(super.state);

  void add(String title) {
    final newToDo = TodoModel(
      title: title,
      id: state.isEmpty ? 0 : state.last.id + 1,
      isCompleted: false,
    );

    state = [...state, newToDo];
  }

  void remove(int id) {
    state = state.where((t) => t.id != id).toList();
  }

  void update(int id) {

    final todos = [...state];

    final index = todos.indexWhere((t) => t.id == id);
    if(index == -1) return;

    final todo = todos[index];
    // todos[index] = todo.copyWith(id : todo.id, title: todo.title, isCompleted : !todo.isCompleted);

    state = todos;
  }
}

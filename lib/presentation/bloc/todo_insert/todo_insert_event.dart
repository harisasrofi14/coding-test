part of 'todo_insert_bloc.dart';

abstract class TodoInsertEvent {
  const TodoInsertEvent();
}

class OnInsertTodo extends TodoInsertEvent {
  final String title;

  const OnInsertTodo(this.title);
}

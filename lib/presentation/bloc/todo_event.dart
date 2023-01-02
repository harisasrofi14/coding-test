part of 'todo_bloc.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class LoadTodoEvent extends TodoEvent {}

class UpdateTodoEvent extends TodoEvent {
  final int id;

  const UpdateTodoEvent({required this.id});
}

class InsertTodoEvent extends TodoEvent {
  final String title;

  const InsertTodoEvent({required this.title});
}

class RemoveTodoEvent extends TodoEvent {
  final int id;

  const RemoveTodoEvent({required this.id});
}

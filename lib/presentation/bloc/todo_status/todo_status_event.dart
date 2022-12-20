part of 'todo_status_bloc.dart';

abstract class TodoStatusEvent {
  const TodoStatusEvent();
}

class OnChangeStatus extends TodoStatusEvent {
  final String id;

  const OnChangeStatus(this.id);
}

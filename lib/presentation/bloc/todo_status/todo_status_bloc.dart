import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/domain/usecases/status_todo.dart';

part 'todo_status_event.dart';
part 'todo_status_state.dart';

class TodoStatusBloc extends Bloc<TodoStatusEvent, TodoStatusState> {
  final StatusTodo statusTodo;

  TodoStatusBloc({required this.statusTodo}) : super(TodoStatusInitial()) {
    on<OnChangeStatus>((event, emit) async {
      final data = event.id;
      final result = await statusTodo.execute(data);
      result.fold((failure) {
        emit(TodoStatusError(error: failure.message));
      }, (result) async {
        emit(TodoStatusSuccess(message: result));
      });
    });
  }
}

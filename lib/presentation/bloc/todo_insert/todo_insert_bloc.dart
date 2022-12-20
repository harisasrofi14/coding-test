import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/insert_todo.dart';

part 'todo_insert_event.dart';
part 'todo_insert_state.dart';

class TodoInsertBloc extends Bloc<TodoInsertEvent, TodoInsertState> {
  final InsertTodo insertTodo;

  TodoInsertBloc({required this.insertTodo}) : super(TodoInsertInitial()) {
    on<OnInsertTodo>((event, emit) async {
      final data = event.title;
      final result = await insertTodo.execute(data);
      result.fold((failure) {
        emit(TodoInsertError(error: failure.message));
      }, (result) async {
        emit(TodoInsertSuccess(message: result));
      });
    });
  }
}

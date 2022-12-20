import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/domain/usecases/get_all_todo.dart';
import 'package:todolist/presentation/bloc/todo_get_all/todo_get_all_event.dart';
import 'package:todolist/presentation/bloc/todo_get_all/todo_get_all_state.dart';

class TodoGetAllBloc extends Bloc<TodoGetAllEvent, TodoGetAllState> {
  final GetAllTodo getAllTodo;

  TodoGetAllBloc({required this.getAllTodo}) : super(TodoGetAllEmpty()) {
    on<OnGetAllTodo>((event, emit) async {
      emit(TodoGetAllLoading());
      final result = await getAllTodo.execute();
      result.fold((failure) {
        emit(TodoGetAllError());
      }, (result) {
        result.isNotEmpty
            ? emit(TodoGetAllHasData(result))
            : emit(TodoGetAllEmpty());
      });
    });
  }
}

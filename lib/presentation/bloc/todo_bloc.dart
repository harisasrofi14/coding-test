import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/domain/usecases/load_todo.dart';

import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/insert_todo.dart';
import '../../domain/usecases/remove_todo.dart';
import '../../domain/usecases/update_todo.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodosState> {
  final LoadTodo loadTodo;
  final UpdateTodo updateTodo;
  final InsertTodo insertTodo;
  final RemoveTodo removeTodo;

  TodoBloc(
      {required this.loadTodo,
      required this.updateTodo,
      required this.insertTodo,
      required this.removeTodo})
      : super(TodosEmptyState()) {
    on<LoadTodoEvent>((event, emit) async {
      emit(TodosLoadingState());
      final result = await loadTodo.execute();
      result.fold((failure) {
        emit(TodoErrorState());
      }, (result) {
        result.isNotEmpty
            ? emit(TodosHasDataState(result))
            : emit(TodosEmptyState());
      });
    });
    on<UpdateTodoEvent>((event, emit) async {
      final data = event.id;
      final result = await updateTodo.execute(data);
      result.fold((failure) {
        emit(TodoErrorState());
      }, (result) async {
        add(LoadTodoEvent());
      });
    });

    on<InsertTodoEvent>((event, emit) async {
      final data = event.title;
      final result = await insertTodo.execute(data);
      result.fold((failure) {
        emit(TodoErrorState());
      }, (result) async {
        add(LoadTodoEvent());
      });
    });

    on<RemoveTodoEvent>((event, emit) async {
      final data = event.id;
      final result = await removeTodo.execute(data);
      result.fold((failure) {
        emit(TodoErrorState());
      }, (result) async {
        add(LoadTodoEvent());
      });
    });
  }
}

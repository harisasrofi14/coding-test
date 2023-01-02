part of 'todo_bloc.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object?> get props => [];
}

class TodosEmptyState extends TodosState {}

class TodosLoadingState extends TodosState {}

class TodoErrorState extends TodosState {}

class TodosHasDataState extends TodosState {
  final List<TodoEntity> result;

  const TodosHasDataState(this.result);

  @override
  List<Object> get props => [result];
}

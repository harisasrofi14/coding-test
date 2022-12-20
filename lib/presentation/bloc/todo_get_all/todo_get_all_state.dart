import 'package:equatable/equatable.dart';

import '../../../domain/entities/todo_entity.dart';

abstract class TodoGetAllState extends Equatable {
  const TodoGetAllState();

  @override
  List<Object?> get props => [];
}

class TodoGetAllEmpty extends TodoGetAllState {}

class TodoGetAllLoading extends TodoGetAllState {}

class TodoGetAllError extends TodoGetAllState {}

class TodoGetAllHasData extends TodoGetAllState {
  final List<TodoEntity> result;

  const TodoGetAllHasData(this.result);

  @override
  List<Object> get props => [result];
}

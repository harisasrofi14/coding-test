part of 'todo_insert_bloc.dart';

abstract class TodoInsertState extends Equatable {
  const TodoInsertState();

  @override
  List<Object?> get props => [];
}

class TodoInsertInitial extends TodoInsertState {}

class TodoInsertError extends TodoInsertState {
  final String error;

  const TodoInsertError({required this.error});
}

class TodoInsertSuccess extends TodoInsertState {
  final String message;

  const TodoInsertSuccess({required this.message});
}

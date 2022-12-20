part of 'todo_status_bloc.dart';

abstract class TodoStatusState extends Equatable {
  const TodoStatusState();

  @override
  List<Object?> get props => [];
}

class TodoStatusInitial extends TodoStatusState {}

class TodoStatusError extends TodoStatusState {
  final String error;

  const TodoStatusError({required this.error});
}

class TodoStatusSuccess extends TodoStatusState {
  final String message;

  const TodoStatusSuccess({required this.message});
}

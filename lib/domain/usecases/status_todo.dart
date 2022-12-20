import 'package:dartz/dartz.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/domain/repository/todo_repository.dart';

class StatusTodo {
  final TodoRepository repository;

  StatusTodo(this.repository);

  Future<Either<Failure, String>> execute(String todo) {
    return repository.updateTodoList(todo);
  }
}

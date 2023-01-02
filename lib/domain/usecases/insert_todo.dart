import 'package:dartz/dartz.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/domain/repository/todo_repository.dart';

class InsertTodo {
  final TodoRepository repository;

  InsertTodo(this.repository);

  Future<Either<Failure, bool>> execute(String todo) {
    return repository.insertTodoList(todo);
  }
}

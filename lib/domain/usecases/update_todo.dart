import 'package:dartz/dartz.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/domain/repository/todo_repository.dart';

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<Either<Failure, bool>> execute(int id) {
    return repository.updateTodoList(id);
  }
}

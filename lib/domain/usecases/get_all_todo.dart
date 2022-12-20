import 'package:dartz/dartz.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/domain/entities/todo_entity.dart';
import 'package:todolist/domain/repository/todo_repository.dart';

class GetAllTodo {
  final TodoRepository repository;

  GetAllTodo(this.repository);

  Future<Either<Failure, List<TodoEntity>>> execute() {
    return repository.getAllTodoList();
  }
}

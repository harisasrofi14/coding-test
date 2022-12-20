import 'package:dartz/dartz.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoEntity>>> getAllTodoList();

  Future<Either<Failure, String>> insertAllTodoList(String todo);

  Future<Either<Failure, String>> updateTodoList(String id);
}

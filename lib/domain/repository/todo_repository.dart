import 'package:dartz/dartz.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoEntity>>> loadTodoList();

  Future<Either<Failure, bool>> insertTodoList(String todo);

  Future<Either<Failure, bool>> updateTodoList(int id);

  Future<Either<Failure, bool>> removeTodoList(int id);
}

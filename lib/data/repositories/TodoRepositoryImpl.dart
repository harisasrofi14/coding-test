import 'package:dartz/dartz.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/data/models/todo_table.dart';
import 'package:todolist/domain/entities/todo_entity.dart';
import 'package:todolist/domain/repository/todo_repository.dart';
import 'package:uuid/uuid.dart';

import '../../common/exception.dart';
import '../datasource/local_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodolistLocalDataSource todolistLocalDataSource;

  TodoRepositoryImpl({required this.todolistLocalDataSource});

  @override
  Future<Either<Failure, List<TodoEntity>>> getAllTodoList() async {
    try {
      final result = await todolistLocalDataSource.getAllTodolist();
      return Right(result.map((data) => data.toEntity()).toList());
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> insertAllTodoList(String todo) async {
    try {
      var uuid = const Uuid().v1();
      var data = TodoEntity(id: uuid.toString(), title: todo, status: false);
      final result = await todolistLocalDataSource
          .insertTodolist(TodoTable.fromEntity(data));
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Either<Failure, String>> updateTodoList(String id) async {
    try {
      final result = await todolistLocalDataSource.updateTodolist(id);
      return Right(result);
    } on DatabaseException catch (e) {
      return Left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:todolist/common/exception.dart';
import 'package:todolist/data/datasource/db/todolist_database_helper.dart';
import 'package:todolist/data/models/todo_table.dart';

abstract class TodolistLocalDataSource {
  Future<bool> insertTodolist(TodoTable todoTable);

  Future<bool> updateTodolist(int id);

  Future<List<TodoTable>> getAllTodolist();

  Future<bool> removeTodoList(int id);
}

class TodolistLocalDataSourceImpl implements TodolistLocalDataSource {
  final TodolistDatabaseHelper databaseHelper;

  TodolistLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<TodoTable>> getAllTodolist() async {
    try {
      final result = databaseHelper.loadData();
      return result;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> insertTodolist(TodoTable todoTable) async {
    try {
      databaseHelper.addTask(todoTable);
      return true;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> updateTodolist(int id) async {
    try {
      await databaseHelper.updateTask(id);
      return true;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<bool> removeTodoList(int id) async {
    try {
      await databaseHelper.deleteTask(id);
      return true;
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}

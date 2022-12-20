import 'package:todolist/common/exception.dart';
import 'package:todolist/data/datasource/db/todolist_database_helper.dart';
import 'package:todolist/data/models/todo_table.dart';

abstract class TodolistLocalDataSource {
  Future<String> insertTodolist(TodoTable todoTable);

  Future<String> updateTodolist(String id);

  Future<List<TodoTable>> getAllTodolist();
}

class TodolistLocalDataSourceImpl implements TodolistLocalDataSource {
  final TodolistDatabaseHelper databaseHelper;

  TodolistLocalDataSourceImpl({required this.databaseHelper});

  @override
  Future<List<TodoTable>> getAllTodolist() async {
    try {
      final result = await databaseHelper.getAllTodos();
      return result.map((data) => TodoTable.fromMap(data)).toList();
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> insertTodolist(TodoTable todoTable) async {
    try {
      await databaseHelper.insertTodo(todoTable);
      return 'Success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> updateTodolist(String id) async {
    try {
      await databaseHelper.updateTodo(id);
      return 'Success';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}

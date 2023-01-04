import 'package:mockito/annotations.dart';
import 'package:todolist/data/datasource/db/todolist_database_helper.dart';
import 'package:todolist/data/datasource/local_data_source.dart';
import 'package:todolist/domain/entities/todo_entity.dart';
import 'package:todolist/domain/repository/todo_repository.dart';
import 'package:todolist/domain/usecases/insert_todo.dart';
import 'package:todolist/domain/usecases/load_todo.dart';
import 'package:todolist/domain/usecases/remove_todo.dart';
import 'package:todolist/domain/usecases/update_todo.dart';

@GenerateMocks([
  TodoRepository,
  TodolistLocalDataSource,
  TodolistDatabaseHelper,
  TodoEntity,
  LoadTodo,
  UpdateTodo,
  InsertTodo,
  RemoveTodo
])
void main() {}

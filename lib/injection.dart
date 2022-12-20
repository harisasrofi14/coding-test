import 'package:get_it/get_it.dart';
import 'package:todolist/data/datasource/db/todolist_database_helper.dart';
import 'package:todolist/data/datasource/local_data_source.dart';
import 'package:todolist/data/repositories/TodoRepositoryImpl.dart';
import 'package:todolist/domain/repository/todo_repository.dart';
import 'package:todolist/domain/usecases/get_all_todo.dart';
import 'package:todolist/domain/usecases/insert_todo.dart';
import 'package:todolist/presentation/bloc/todo_get_all/todo_get_all_bloc.dart';
import 'package:todolist/presentation/bloc/todo_insert/todo_insert_bloc.dart';
import 'package:todolist/presentation/bloc/todo_status/todo_status_bloc.dart';

import 'domain/usecases/status_todo.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<TodolistLocalDataSource>(
      () => TodolistLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerLazySingleton<TodolistDatabaseHelper>(
      () => TodolistDatabaseHelper());

  locator.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(todolistLocalDataSource: locator()));

  locator.registerLazySingleton(() => GetAllTodo(locator()));
  locator.registerLazySingleton(() => InsertTodo(locator()));
  locator.registerLazySingleton(() => StatusTodo(locator()));

  locator.registerFactory(() => TodoGetAllBloc(getAllTodo: locator()));

  locator.registerFactory(() => TodoInsertBloc(insertTodo: locator()));
  locator.registerFactory(() => TodoStatusBloc(statusTodo: locator()));
}

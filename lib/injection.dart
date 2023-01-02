import 'package:get_it/get_it.dart';
import 'package:todolist/data/datasource/db/todolist_database_helper.dart';
import 'package:todolist/data/datasource/local_data_source.dart';
import 'package:todolist/data/repositories/TodoRepositoryImpl.dart';
import 'package:todolist/domain/repository/todo_repository.dart';
import 'package:todolist/domain/usecases/insert_todo.dart';
import 'package:todolist/domain/usecases/load_todo.dart';
import 'package:todolist/domain/usecases/remove_todo.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';

import 'domain/usecases/update_todo.dart';

final locator = GetIt.instance;

void init() {
  locator.registerLazySingleton<TodolistLocalDataSource>(
      () => TodolistLocalDataSourceImpl(databaseHelper: locator()));

  locator.registerSingletonAsync<TodolistDatabaseHelper>(() async {
    final configService = TodolistDatabaseHelper();
    await configService.init();
    return configService;
  });

  locator.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(todolistLocalDataSource: locator()));

  locator.registerLazySingleton(() => LoadTodo(locator()));
  locator.registerLazySingleton(() => InsertTodo(locator()));
  locator.registerLazySingleton(() => UpdateTodo(locator()));
  locator.registerLazySingleton(() => RemoveTodo(locator()));
  locator.registerFactory(() => TodoBloc(
      loadTodo: locator(),
      updateTodo: locator(),
      insertTodo: locator(),
      removeTodo: locator()));
}

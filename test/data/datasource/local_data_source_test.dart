import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/common/exception.dart';
import 'package:todolist/data/datasource/local_data_source.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late TodolistLocalDataSourceImpl dataSource;
  late MockTodolistDatabaseHelper mockTodolistDatabaseHelper;

  setUp(() {
    mockTodolistDatabaseHelper = MockTodolistDatabaseHelper();
    dataSource =
        TodolistLocalDataSourceImpl(databaseHelper: mockTodolistDatabaseHelper);
  });

  group('insertTodolist', () {
    test('should return true when insert to database is success', () async {
      when(mockTodolistDatabaseHelper.addTask(testTodoTable))
          .thenAnswer((_) async => true);

      final result = await dataSource.insertTodolist(testTodoTable);

      expect(result, true);
    });
    test('should throw DatabaseException when insert to database is failed',
        () async {
      when(mockTodolistDatabaseHelper.addTask(testTodoTable))
          .thenThrow(Exception());

      final call = dataSource.insertTodolist(testTodoTable);

      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('updateTodolist', () {
    test('should return true when update to database is success', () async {
      when(mockTodolistDatabaseHelper.updateTask(111))
          .thenAnswer((_) async => true);

      final result = await dataSource.updateTodolist(111);

      expect(result, true);
    });
    test('should throw DatabaseException when update to database is failed',
        () async {
      when(mockTodolistDatabaseHelper.updateTask(111)).thenThrow(Exception());

      final call = dataSource.updateTodolist(111);

      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });

  group('deleteTodolist', () {
    test('should return true when delete from database is success', () async {
      when(mockTodolistDatabaseHelper.deleteTask(111))
          .thenAnswer((_) async => true);

      final result = await dataSource.removeTodoList(111);

      expect(result, true);
    });
    test('should throw DatabaseException when delete from database is failed',
        () async {
      when(mockTodolistDatabaseHelper.deleteTask(111)).thenThrow(Exception());

      final call = dataSource.removeTodoList(111);

      expect(() => call, throwsA(isA<DatabaseException>()));
    });
  });
}

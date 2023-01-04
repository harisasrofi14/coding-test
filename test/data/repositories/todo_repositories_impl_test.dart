import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/data/models/todo_table.dart';
import 'package:todolist/data/repositories/todo_repositories_impl.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helpers.mocks.dart';

class FakeTodo extends Fake implements TodoEntity {}

void main() {
  late TodoRepositoryImpl repository;
  late MockTodolistLocalDataSource mockTodolistLocalDataSource;

  setUp(() {
    mockTodolistLocalDataSource = MockTodolistLocalDataSource();
    repository = TodoRepositoryImpl(
        todolistLocalDataSource: mockTodolistLocalDataSource);
  });

  group('loadTodoList', () {
    test('should return data from local database', () async {
      when(mockTodolistLocalDataSource.getAllTodolist())
          .thenAnswer((_) async => [testTodoTable]);

      final result = await repository.loadTodoList();
      final resultList = result.getOrElse(() => []);
      expect(resultList, [testTodoEntity]);
    });
  });

  group('insertTodoList', () {
    test('should return true when insert is successful', () async {
      when(mockTodolistLocalDataSource
              .insertTodolist(TodoTable.fromEntity(testTodoEntity)))
          .thenAnswer((_) async => true);
      final result = await repository.insertTodoList('Submit Testing');
      expect(result, const Right(true));
    });
  });

  group('updateTodoList', () {
    test('should return true when update is successful', () async {
      when(mockTodolistLocalDataSource.updateTodolist(1111))
          .thenAnswer((realInvocation) async => true);
      final result = await repository.updateTodoList(1111);
      expect(result, const Right(true));
    });
  });

  group('removeTodoList', () {
    test('should return true when remove is successful', () async {
      when(mockTodolistLocalDataSource.removeTodoList(1111))
          .thenAnswer((realInvocation) async => true);
      final result = await repository.removeTodoList(1111);
      expect(result, const Right(true));
    });
  });
}

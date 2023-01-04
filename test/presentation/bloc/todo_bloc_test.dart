import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/common/failure.dart';
import 'package:todolist/domain/usecases/insert_todo.dart';
import 'package:todolist/domain/usecases/load_todo.dart';
import 'package:todolist/domain/usecases/remove_todo.dart';
import 'package:todolist/domain/usecases/update_todo.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late TodoBloc todoBloc;
  late LoadTodo mockLoadTodo;
  late UpdateTodo mockUpdateTodo;
  late InsertTodo mockInsertTodo;
  late RemoveTodo mockRemoveTodo;

  setUp(() {
    mockInsertTodo = MockInsertTodo();
    mockLoadTodo = MockLoadTodo();
    mockRemoveTodo = MockRemoveTodo();
    mockUpdateTodo = MockUpdateTodo();
    todoBloc = TodoBloc(
        loadTodo: mockLoadTodo,
        updateTodo: mockUpdateTodo,
        insertTodo: mockInsertTodo,
        removeTodo: mockRemoveTodo);
  });

  group('Load bloc', () {
    blocTest<TodoBloc, TodosState>(
        'Should emit [Loading, HashData] when load data is successful',
        build: () {
          when(mockLoadTodo.execute())
              .thenAnswer((_) async => const Right([testTodoEntity]));
          return todoBloc;
        },
        act: (bloc) => bloc.add(LoadTodoEvent()),
        expect: () => [
              TodosLoadingState(),
              const TodosHasDataState([testTodoEntity])
            ],
        verify: (bloc) {
          verify(mockLoadTodo.execute());
        });

    blocTest<TodoBloc, TodosState>(
        'Should emit [Loading, Error] when load data is unsuccessful',
        build: () {
          when(mockLoadTodo.execute()).thenAnswer((_) async =>
              const Left(DatabaseFailure('Failed to access database')));
          return todoBloc;
        },
        act: (bloc) => bloc.add(LoadTodoEvent()),
        expect: () => [TodosLoadingState(), TodoErrorState()],
        verify: (bloc) {
          verify(mockLoadTodo.execute());
        });
  });

  group('Remove bloc', () {
    blocTest<TodoBloc, TodosState>(
        'Should emit [Loading, HashData] when remove data is successful',
        build: () {
          when(mockRemoveTodo.execute(1111))
              .thenAnswer((_) async => const Right(true));
          when(mockLoadTodo.execute())
              .thenAnswer((_) async => const Right([testTodoEntity]));
          return todoBloc;
        },
        act: (bloc) => bloc.add(const RemoveTodoEvent(id: 1111)),
        expect: () => [
              TodosLoadingState(),
              const TodosHasDataState([testTodoEntity])
            ],
        verify: (bloc) {
          verify(mockRemoveTodo.execute(1111));
        });

    blocTest<TodoBloc, TodosState>(
        'Should emit [Error] when load data is unsuccessful',
        build: () {
          when(mockRemoveTodo.execute(1111)).thenAnswer((_) async =>
              const Left(DatabaseFailure('Failed to access database')));
          return todoBloc;
        },
        act: (bloc) => bloc.add(RemoveTodoEvent(id: 1111)),
        expect: () => [TodoErrorState()],
        verify: (bloc) {
          verify(mockRemoveTodo.execute(1111));
        });
  });

  group('Insert bloc', () {
    blocTest<TodoBloc, TodosState>(
        'Should emit [Loading, HashData] when insert data is successful',
        build: () {
          when(mockInsertTodo.execute('testing'))
              .thenAnswer((_) async => const Right(true));
          when(mockLoadTodo.execute())
              .thenAnswer((_) async => const Right([testTodoEntity]));
          return todoBloc;
        },
        act: (bloc) => bloc.add(const InsertTodoEvent(title: 'testing')),
        expect: () => [
              TodosLoadingState(),
              const TodosHasDataState([testTodoEntity])
            ],
        verify: (bloc) {
          verify(mockInsertTodo.execute('testing'));
        });

    blocTest<TodoBloc, TodosState>(
        'Should emit [Error] when load data is unsuccessful',
        build: () {
          when(mockInsertTodo.execute('testing')).thenAnswer((_) async =>
              const Left(DatabaseFailure('Failed to access database')));
          return todoBloc;
        },
        act: (bloc) => bloc.add(const InsertTodoEvent(title: 'testing')),
        expect: () => [TodoErrorState()],
        verify: (bloc) {
          verify(mockInsertTodo.execute('testing'));
        });
  });

  group('Update bloc', () {
    blocTest<TodoBloc, TodosState>(
        'Should emit [Loading, HashData] when update data is successful',
        build: () {
          when(mockUpdateTodo.execute(1111))
              .thenAnswer((_) async => const Right(true));
          when(mockLoadTodo.execute())
              .thenAnswer((_) async => const Right([testTodoEntity]));
          return todoBloc;
        },
        act: (bloc) => bloc.add(const UpdateTodoEvent(id: 1111)),
        expect: () => [
              TodosLoadingState(),
              const TodosHasDataState([testTodoEntity])
            ],
        verify: (bloc) {
          verify(mockUpdateTodo.execute(1111));
        });

    blocTest<TodoBloc, TodosState>(
        'Should emit [Error] when update data is unsuccessful',
        build: () {
          when(mockUpdateTodo.execute(1111)).thenAnswer((_) async =>
              const Left(DatabaseFailure('Failed to access database')));
          return todoBloc;
        },
        act: (bloc) => bloc.add(const UpdateTodoEvent(id: 1111)),
        expect: () => [TodoErrorState()],
        verify: (bloc) {
          verify(mockUpdateTodo.execute(1111));
        });
  });
}

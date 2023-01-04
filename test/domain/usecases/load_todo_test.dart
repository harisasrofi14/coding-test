import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/domain/usecases/load_todo.dart';

import '../../dummy_data/dummy_object.dart';
import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockTodoRepository mockTodoRepository;
  late LoadTodo useCase;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    useCase = LoadTodo(mockTodoRepository);
  });

  test('should return data when load data is successful', () async {
    when(mockTodoRepository.loadTodoList())
        .thenAnswer((_) async => const Right([testTodoEntity]));
    final result = await useCase.execute();
    expect(result, const Right([testTodoEntity]));
  });
}

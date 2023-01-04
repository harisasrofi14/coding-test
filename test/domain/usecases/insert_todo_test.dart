import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/domain/usecases/insert_todo.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockTodoRepository mockTodoRepository;
  late InsertTodo useCase;
  const tTitle = "Testing";
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    useCase = InsertTodo(mockTodoRepository);
  });

  test('should return true when insert data is successful', () async {
    when(mockTodoRepository.insertTodoList(tTitle))
        .thenAnswer((_) async => const Right(true));
    final result = await useCase.execute(tTitle);
    expect(result, const Right(true));
  });
}

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todolist/domain/usecases/update_todo.dart';

import '../../helpers/test_helpers.mocks.dart';

void main() {
  late MockTodoRepository mockTodoRepository;
  late UpdateTodo useCase;
  const tId = 1111;
  setUp(() {
    mockTodoRepository = MockTodoRepository();
    useCase = UpdateTodo(mockTodoRepository);
  });

  test('should return true when update data is successful', () async {
    when(mockTodoRepository.updateTodoList(tId))
        .thenAnswer((_) async => const Right(true));
    final result = await useCase.execute(tId);
    expect(result, const Right(true));
  });
}

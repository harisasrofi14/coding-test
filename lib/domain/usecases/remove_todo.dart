import 'package:dartz/dartz.dart';

import '../../common/failure.dart';
import '../repository/todo_repository.dart';

class RemoveTodo {
  final TodoRepository repository;

  RemoveTodo(this.repository);

  Future<Either<Failure, bool>> execute(int id) {
    return repository.removeTodoList(id);
  }
}

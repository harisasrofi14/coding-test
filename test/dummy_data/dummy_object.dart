import 'package:todolist/data/models/todo_table.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

final testTodoTable =
    TodoTable(id: 111111, title: 'Submit Testing', status: false);
const testTodoEntity =
    TodoEntity(id: 111111, title: 'Submit Testing', status: false);
final tTodoEntityList = <TodoEntity>[testTodoEntity];

import 'package:hive/hive.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

part 'todo_table.g.dart';

@HiveType(typeId: 1)
class TodoTable extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final bool status;

  TodoTable({required this.id, required this.title, required this.status});

  factory TodoTable.fromEntity(TodoEntity todo) =>
      TodoTable(id: todo.id, title: todo.title, status: todo.status);

  TodoEntity toEntity() => TodoEntity(id: id, title: title, status: status);
}

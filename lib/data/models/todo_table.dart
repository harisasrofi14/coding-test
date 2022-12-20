import 'package:equatable/equatable.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

class TodoTable extends Equatable {
  final String id;
  final String title;
  final int status;

  const TodoTable(
      {required this.id, required this.title, required this.status});

  factory TodoTable.fromMap(Map<String, dynamic> map) =>
      TodoTable(id: map['id'], title: map['title'], status: map['status']);

  factory TodoTable.fromEntity(TodoEntity todo) =>
      TodoTable(id: todo.id, title: todo.title, status: todo.status ? 1 : 0);

  TodoEntity toEntity() =>
      TodoEntity(id: id, title: title, status: status == 1 ? true : false);

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'status': status};

  @override
  List<Object?> get props {
    return [id, title, status];
  }
}

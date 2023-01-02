import 'package:hive/hive.dart';
import 'package:todolist/data/models/todo_table.dart';

class TodolistDatabaseHelper {
  late Box<TodoTable> _tasksBox;

  Future<void> init() async {
    Hive.registerAdapter(TodoTableAdapter());
    _tasksBox = await Hive.openBox<TodoTable>('tasks');
  }

  List<TodoTable> loadData() {
    final tasks = _tasksBox.values;
    var items = tasks.toList();
    items.sort((a, b) => b.id.compareTo(a.id));
    return items;
  }

  Future<void> addTask(final TodoTable todoTable) async {
    await _tasksBox.add(todoTable);
  }

  Future<void> updateTask(final int id) async {
    final taskToEdit =
        _tasksBox.values.firstWhere((element) => element.id == id);
    final index = taskToEdit.key as int;
    await _tasksBox.put(index,
        TodoTable(id: id, title: taskToEdit.title, status: !taskToEdit.status));
  }

  Future<void> deleteTask(final int id) async {
    final taskToEdit =
        _tasksBox.values.firstWhere((element) => element.id == id);
    final index = taskToEdit.key as int;
    await _tasksBox.delete(index);
  }
}

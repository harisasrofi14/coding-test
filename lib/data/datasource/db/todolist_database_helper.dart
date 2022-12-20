import 'package:sqflite/sqflite.dart';
import 'package:todolist/data/models/todo_table.dart';

class TodolistDatabaseHelper {
  static TodolistDatabaseHelper? _databaseHelper;

  TodolistDatabaseHelper._instace() {
    _databaseHelper = this;
  }

  factory TodolistDatabaseHelper() =>
      _databaseHelper ?? TodolistDatabaseHelper._instace();

  static Database? _database;

  Future<Database?> get database async {
    _database = await _initDb();
    return _database;
  }

  static const String _tblTodolist = 'todolist';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/todo.db';
    var db = await openDatabase(databasePath, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblTodolist (
        id TEXT PRIMARY KEY,
        title TEXT,
        status INTEGER
      );
      CREATE UNIQUE INDEX idx_todo
      ON $_tblTodolist (rowid);
    ''');
  }

  Future<int> insertTodo(TodoTable todoTable) async {
    final db = await database;
    return await db!.insert(_tblTodolist, todoTable.toJson());
  }

  Future<List<Map<String, dynamic>>> getAllTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblTodolist);
    return results;
  }

  Future<int> updateTodo(String id) async {
    final db = await database;
    return await db!.rawUpdate('''
    UPDATE $_tblTodolist 
    SET status = ?
    WHERE id = ?
    ''', [1, id]);
    // return await db.update(_tblTodolist,todoTable.toMap(), where: 'id = ?', whereArgs: id);
  }
}

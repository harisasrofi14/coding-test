import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/domain/entities/todo_entity.dart';
import 'package:todolist/presentation/bloc/todo_status/todo_status_bloc.dart';

import '../bloc/todo_get_all/todo_get_all_bloc.dart';
import '../bloc/todo_get_all/todo_get_all_event.dart';

class CardTodo extends StatelessWidget {
  final TodoEntity data;

  const CardTodo({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: GestureDetector(
            onTap: () {
              if (!data.status) {
                BlocProvider.of<TodoStatusBloc>(context)
                    .add(OnChangeStatus(data.id));
                BlocProvider.of<TodoGetAllBloc>(context).add(OnGetAllTodo());
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(data.title[0].toUpperCase()),
                  ),
                  title: Text(data.title,
                      style: TextStyle(
                          decoration: data.status
                              ? TextDecoration.lineThrough
                              : TextDecoration.none))),
            )));
  }
}

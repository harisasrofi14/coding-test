import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todolist/domain/entities/todo_entity.dart';

import '../bloc/todo_bloc.dart';

class CardTodo extends StatelessWidget {
  final TodoEntity data;

  const CardTodo({required this.data, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (BuildContext context) async {
                BlocProvider.of<TodoBloc>(context)
                    .add(RemoveTodoEvent(id: data.id));
              },
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Card(
          color: data.status ? Colors.grey[200] : Colors.white,
          child: GestureDetector(
            onTap: () => BlocProvider.of<TodoBloc>(context)
                .add(UpdateTodoEvent(id: data.id)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      data.title[0].toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  title: Text(data.title,
                      style: TextStyle(
                          decoration: data.status
                              ? TextDecoration.lineThrough
                              : TextDecoration.none))),
            ),
          ),
        ),
      ),
    );
  }
}

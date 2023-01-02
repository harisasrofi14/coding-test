import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/presentation/bloc/todo_bloc.dart';
import 'package:todolist/presentation/widgets/add_todo_dialog.dart';
import 'package:todolist/presentation/widgets/card_todo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      BlocProvider.of<TodoBloc>(context).add(LoadTodoEvent());
    });
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void saveNewTodo() {
    if (_noteController.text.isNotEmpty) {
      BlocProvider.of<TodoBloc>(context)
          .add(InsertTodoEvent(title: _noteController.text));
    }
    _noteController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<TodoBloc, TodosState>(
                builder: (context, state) {
                  if (state is TodosLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TodosHasDataState) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final data = state.result[index];
                        return CardTodo(data: data);
                      },
                      itemCount: state.result.length,
                    );
                  } else if (state is TodosEmptyState) {
                    return const Center(
                      child: Text('Empty'),
                    );
                  } else if (state is TodoErrorState) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    return Container();
                  }
                },
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddTodoDialog(
                      controller: _noteController,
                      onCancel: () => Navigator.of(context).pop(),
                      onSave: saveNewTodo);
                });
          },
          child: const Icon(Icons.add),
        ));
  }
}

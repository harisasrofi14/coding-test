import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/presentation/bloc/todo_get_all/todo_get_all_bloc.dart';
import 'package:todolist/presentation/bloc/todo_get_all/todo_get_all_event.dart';
import 'package:todolist/presentation/bloc/todo_get_all/todo_get_all_state.dart';
import 'package:todolist/presentation/bloc/todo_insert/todo_insert_bloc.dart';
import 'package:todolist/presentation/widgets/CardTodo.dart';

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
      BlocProvider.of<TodoGetAllBloc>(context).add(OnGetAllTodo());
    });
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<TodoGetAllBloc, TodoGetAllState>(
                builder: (context, state) {
                  if (state is TodoGetAllLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TodoGetAllHasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final data = state.result[index];
                        return CardTodo(data: data);
                      },
                      itemCount: state.result.length,
                    );
                  } else if (state is TodoGetAllEmpty) {
                    return const Center(
                      child: Text('Empty'),
                    );
                  } else if (state is TodoGetAllError) {
                    return const Center(
                      child: Text('Error'),
                    );
                  } else {
                    return const Center(
                      child: Text('Init'),
                    );
                  }
                },
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      title: const Text("Add new Item"),
                      content: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextFormField(
                                  controller: _noteController,
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  decoration: const InputDecoration(
                                      hintText: 'Type your new todo'),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      if (_noteController.text.isNotEmpty) {
                                        BlocProvider.of<TodoInsertBloc>(context)
                                            .add(OnInsertTodo(
                                                _noteController.text));
                                        BlocProvider.of<TodoGetAllBloc>(context)
                                            .add(OnGetAllTodo());
                                      }
                                      _noteController.clear();
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Add'))
                              ])));
                });
          },
          tooltip: 'Add new item',
          child: const Icon(Icons.add),
        ));
  }
}

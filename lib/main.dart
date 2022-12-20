import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:todolist/injection.dart' as di;
import 'package:todolist/presentation/bloc/todo_get_all/todo_get_all_bloc.dart';
import 'package:todolist/presentation/bloc/todo_insert/todo_insert_bloc.dart';
import 'package:todolist/presentation/bloc/todo_status/todo_status_bloc.dart';
import 'package:todolist/presentation/pages/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(create: (_) => di.locator<TodoGetAllBloc>()),
        BlocProvider(create: (_) => di.locator<TodoInsertBloc>()),
        BlocProvider(create: (_) => di.locator<TodoStatusBloc>())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

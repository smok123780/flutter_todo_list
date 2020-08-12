import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/main_todo_list_screen.dart';
import 'package:todo_list_app/providers/tasks.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Tasks(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: DefaultTabController(
        length: 2,
        child: MainTodoListView(title: 'ReNest'),
      ),
    );
  }
}

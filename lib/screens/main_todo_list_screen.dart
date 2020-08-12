import 'package:flutter/material.dart';
import 'package:todo_list_app/screens/add_task_screen.dart';
import 'package:todo_list_app/screens/search_screen.dart';
import 'package:todo_list_app/widgets/completed_tasks.dart';
import 'package:todo_list_app/widgets/custom_menu_button.dart';
import 'package:todo_list_app/widgets/custom_text_field.dart';
import 'package:todo_list_app/widgets/expansion_tiles.dart';

class MainTodoListView extends StatefulWidget {
  MainTodoListView({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainTodoListViewState createState() => _MainTodoListViewState();
}

class _MainTodoListViewState extends State<MainTodoListView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomMenuButton(),
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddTaskScreen())),
          ),
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height / 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MaterialButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchScreen())),
                child: CustomTextField(
                  enabled: false,
                  autoFocus: false,
                  visibleIcon: false,
                ),
              ),
              TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: "Tasks"),
                  Tab(text: "Completed"),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        children: [
          SingleChildScrollView(
            child: ExpansionTiles(),
          ),
          CompletedTasks(),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/add_task_button.dart';

class AddTaskScreen extends StatelessWidget {
  final List _tasks = [
    "Book professional movers",
    "Prepare the house",
    "Review moving plans",
    "Prepare for payment",
    "Pack the essential box",
    "Prepare appliances",
    "Measure furniture and doorways"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Transform.rotate(
          angle: 90 * pi / 180,
          child: IconButton(
            icon: Icon(Icons.expand_more, size: 24,),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text("Add Task"),
        elevation: 0,
      ),
      body: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: _tasks.length,
        itemBuilder: (BuildContext context, index) {
          return AddTaskButton(_tasks[index]);
        },
      ),
    );
  }
}

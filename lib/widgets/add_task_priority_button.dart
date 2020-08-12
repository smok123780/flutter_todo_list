import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/enums/priority.dart';
import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/providers/tasks.dart';

class AddTaskPriorityButton extends StatelessWidget {
  final Color color;
  final String title;
  final String task;
  final Priority priority;

  AddTaskPriorityButton(this.color, this.title, this.task, this.priority);

  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);
    return MaterialButton(
      height: 48,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(4.0),
        ),
      ),
      elevation: 0.0,
      color: color,
      onPressed: () {
        tasksData.addTask(Task(task, priority: priority));
        Navigator.of(context).pop();
      },
      child: Container(
        width: 50,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
          maxLines: 2,
        ),
      ),
    );
  }
}

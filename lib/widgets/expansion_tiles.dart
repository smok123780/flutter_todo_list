import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/tasks.dart';
import 'package:todo_list_app/widgets/completed_tasks.dart';
import 'package:todo_list_app/widgets/expansion_tile_button.dart';

class ExpansionTiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);
    final highPriorityTasks = tasksData.highPriorityTasks;
    final normalPriorityTasks = tasksData.normalPriorityTasks;
    final lowPriorityTasks = tasksData.lowPriorityTasks;
    return Column(
      children: [
        ExpansionTileButton("HIGH PRIORITY", Colors.redAccent, highPriorityTasks),
        ExpansionTileButton("NORMAL PRIORITY", Colors.green, normalPriorityTasks),
        ExpansionTileButton("LOW PRIORITY", Colors.blue,  lowPriorityTasks),
        CompletedTasks(),
      ],
    );
  }
}

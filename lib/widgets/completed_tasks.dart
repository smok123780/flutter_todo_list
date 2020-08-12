import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/providers/tasks.dart';
import 'package:todo_list_app/widgets/item_tile.dart';

class CompletedTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tasksData = Provider.of<Tasks>(context);
    final completedTasks = tasksData.completedTasks;

    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      removeBottom: true,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: completedTasks.length,
        itemBuilder: (BuildContext context, index) {
          return ItemTile(completedTasks[index]);
        },
      ),
    );
  }
}

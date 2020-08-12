import 'package:flutter/material.dart';
import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/widgets/item_tile.dart';
import 'package:todo_list_app/widgets/expansion_tile.dart' as custom;

class ExpansionTileButton extends StatelessWidget {
  final String title;
  final Color color;
  final List<Task> tasks;

  ExpansionTileButton(this.title, this.color, this.tasks);

  @override
  Widget build(BuildContext context) {
    if (tasks.length > 0)
      return custom.ExpansionTile(
        title: Text(
          title,
          style: TextStyle(color: color),
        ),
        initiallyExpanded: true,
        maintainState: true,
        backgroundColor: Colors.grey[100],
        children: [
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, index) {
              return ItemTile(tasks[index]);
            },
          )
        ],
      );
    else
      return Container();
  }
}

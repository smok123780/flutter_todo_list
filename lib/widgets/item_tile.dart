import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/providers/tasks.dart';

class ItemTile extends StatelessWidget {
  final Task item;

  ItemTile(this.item);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 8.0, right: 8.0),
      child: MaterialButton(
        onPressed: () {
          Provider.of<Tasks>(context, listen: false).toggleTodo(item);
        },
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
        ),
        color: Colors.white,
        elevation: 0.0,
        minWidth: double.infinity,
        height: 72,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              item.complete ? MdiIcons.checkCircle : MdiIcons.circleOutline,
              color: Colors.grey,
              size: 32,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(
                  item.task,
                  style: item.complete
                      ? TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough)
                      : TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

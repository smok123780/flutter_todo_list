import 'package:flutter/material.dart';
import 'package:todo_list_app/enums/priority.dart';
import 'package:todo_list_app/widgets/add_task_priority_button.dart';

class AddTaskButton extends StatefulWidget {
  final String task;

  AddTaskButton(this.task);

  @override
  _AddTaskButtonState createState() => _AddTaskButtonState();
}

class _AddTaskButtonState extends State<AddTaskButton> {
  bool asd = true;

  @override
  Widget build(BuildContext context) {
    if (asd)
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 8.0, right: 8.0),
        child: MaterialButton(
          onPressed: () {
            asd = false;
            setState(() {});
          },
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(4.0),
            ),
          ),
          color: Colors.grey[100],
          elevation: 0.0,
          minWidth: double.infinity,
          height: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Text(widget.task),
              ),
              Icon(
                Icons.add,
                color: Colors.black,
                size: 32,
              ),
            ],
          ),
        ),
      );
    else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 8.0, right: 8.0),
        child: Container(
          width: double.infinity,
          height: 56,
//margin: ,
//          color: Colors.grey[700],
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AddTaskPriorityButton(Colors.red, "High Priority", widget.task, Priority.HIGH),
                  AddTaskPriorityButton(Colors.green, "Normal Priority", widget.task, Priority.NORMAL),
                  AddTaskPriorityButton(Colors.blue, "Low Priority", widget.task, Priority.LOW),
                  IconButton(
                    onPressed: () {
                      asd = true;
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}

import 'package:todo_list_app/enums/priority.dart';
import 'package:uuid/uuid.dart';

class Task {
  bool complete;
  String id;
  String task;
  Priority priority;

  Task(this.task, {this.complete = false, id, this.priority}) {
    this.id = id ?? Uuid().v4();
  }

  void toggleCompleted() {
    complete = !complete;
  }
}

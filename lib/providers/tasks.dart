import 'package:flutter/material.dart';
import 'package:todo_list_app/enums/priority.dart';
import 'package:todo_list_app/models/task.dart';

class Tasks extends ChangeNotifier {
  /// Starting Data
  List<Task> _tasks = [
    Task("Take measurements", priority: Priority.HIGH),
    Task("Do a change of address", priority: Priority.HIGH),
    Task("Book professional movers", priority: Priority.NORMAL),
    Task("Begin packing", priority: Priority.NORMAL),
    Task("Order supplies", priority: Priority.LOW),
  ];

  List<Task> get allTasks {
    return [..._tasks];
  }

  List<Task> get highPriorityTasks {
    return [
      ..._tasks
          .where((tasks) => !tasks.complete && tasks.priority == Priority.HIGH)
    ];
  }

  List<Task> get normalPriorityTasks {
    return [
      ..._tasks.where(
          (tasks) => !tasks.complete && tasks.priority == Priority.NORMAL)
    ];
  }

  List<Task> get lowPriorityTasks {
    return [
      ..._tasks
          .where((tasks) => !tasks.complete && tasks.priority == Priority.LOW)
    ];
  }

  List<Task> get completedTasks {
    return [..._tasks.where((tasks) => tasks.complete)];
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(Task todo) {
    final taskIndex = _tasks.indexOf(todo);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  List<Task> _searchedTasks = [];

  void searchTasks(String text) {
    _searchedTasks.clear();
    if (text.isNotEmpty && text != " ")
      _searchedTasks.addAll([
        ..._tasks.where((element) =>
            element.task.toLowerCase().contains(text.toLowerCase()))
      ]);
    notifyListeners();
  }

  void clearSearchedTasks(){
    _searchedTasks.clear();
    notifyListeners();
  }

  List<Task> get searchedTasks {
    return [..._searchedTasks];
  }

  List<Task> get highPrioritySearchedTasks {
    return [
      ..._searchedTasks.where((tasks) => tasks.priority == Priority.HIGH)
    ];
  }

  List<Task> get normalPrioritySearchedTasks {
    return [
      ..._searchedTasks.where((tasks) => tasks.priority == Priority.NORMAL)
    ];
  }

  List<Task> get lowPrioritySearchedTasks {
    return [..._searchedTasks.where((tasks) => tasks.priority == Priority.LOW)];
  }
}

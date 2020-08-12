import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list_app/enums/priority.dart';
import 'package:todo_list_app/models/task.dart';
import 'package:todo_list_app/providers/tasks.dart';

void main() {
  group('Tasks', () {
    test("All tasks return all tasks", () {
      final tasks = Tasks();

      List<Task> allTasks = tasks.allTasks;

      expect(allTasks.length, 5);
    });
    test("Return all high priority tasks", () {
      final tasks = Tasks();

      List<Task> highPriorityTasks = tasks.highPriorityTasks;

      expect(highPriorityTasks.length, 2);
    });

    test("Return all normal priority tasks", () {
      final tasks = Tasks();

      List<Task> normalPriorityTasks = tasks.normalPriorityTasks;

      expect(normalPriorityTasks.length, 2);
    });

    test("Return all low priority tasks", () {
      final tasks = Tasks();

      List<Task> lowPriorityTasks = tasks.lowPriorityTasks;

      expect(lowPriorityTasks.length, 1);
    });

    test("Adds new task", () {
      final tasks = Tasks();

      tasks.addTask(Task("New task", priority: Priority.NORMAL));

      expect(tasks.allTasks.length, 6);
    });

    test("Expect Task to be added to correct priority", () {
      final tasks = Tasks();

      tasks.addTask(Task("New task", priority: Priority.NORMAL));

      expect(tasks.normalPriorityTasks.length, 3);
    });

    test("Expect Task to change to completed on toggle", () {
      final tasks = Tasks();
      tasks.toggleTodo(tasks.allTasks.first);

      expect(tasks.allTasks.first.complete, true);
    });

    test("Expect to find one task given the phrase", () {
      final tasks = Tasks();
      tasks.searchTasks("Book");

      expect(tasks.searchedTasks.length, 1);
    });
  });
}

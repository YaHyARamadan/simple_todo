import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do_app/features/main_screen/model/todo_model.dart';

class TaskProvider extends ChangeNotifier {
  final TextEditingController task = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController time = TextEditingController();
  final Box _todoBox = Hive.box('todoBox');

  Future<void> getTimeFromUser(BuildContext context) async {
    var pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final formattedTime = pickedTime.format(context);
      time.text = formattedTime;
      notifyListeners();
    }
  }

  void addTask(
      {required String task,
      required String description,
      required String time}) {
    final newTask = Todo(task: task, description: task, time: task);
    _todoBox.add(newTask.toMap());
    notifyListeners();
  }

  List<Todo> get getTasks {
    return _todoBox.values
        .map((task) => Todo.fromMap(Map<String, dynamic>.from(task)))
        .toList();
  }

  void updateTask(
      {required String task,
      required String description,
      required String time,
      index}) {
    final updatedTask = Todo(task: task, description: task, time: task);
    _todoBox.putAt(index, updatedTask.toMap());
    notifyListeners();
  }
  void deleteTask(int index) {
    _todoBox.deleteAt(index);
    notifyListeners();
  }
}

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

  void addTask({required String task, required String description, required String time}) {
    final newTask = Todo(task: task, description: description, time: time);
    _todoBox.add(newTask.toMap());
    clearControllers();
    notifyListeners();
  }

  List<Todo> get getTasks {
    return _todoBox.values
        .map((task) => Todo.fromMap(Map<String, dynamic>.from(task)))
        .toList();
  }

  void updateTask({required String task, required String description, required String time, required int index}) {
    final updatedTask = Todo(task: task, description: description, time: time);
    _todoBox.putAt(index, updatedTask.toMap());
    notifyListeners();
  }

   deleteTask(int index) {
    _todoBox.deleteAt(index);
    notifyListeners();
  }

  void clearControllers() {
    task.clear();
    description.clear();
    time.clear();
  }

  @override
  void dispose() {
    task.dispose();
    description.dispose();
    time.dispose();
    super.dispose();
  }
}

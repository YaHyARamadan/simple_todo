import 'package:hive/hive.dart';

class Todo {
  String task;
  String description;
  String time;

  Todo({required this.task, required this.description, required this.time});

  Map<String, dynamic> toMap() {
    return {
      'task': task,
      'description': description,
      'time': time,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) => Todo(
      task: map['task'], description: map['description'], time: map['time']);
}

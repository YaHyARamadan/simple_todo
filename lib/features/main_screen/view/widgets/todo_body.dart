import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_app/core/styles/my_text_style.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({
    super.key,
    required this.taskName,
    // required this.checkedBoxValue,
    required this.taskSubtitle,
    this.deleteTask,
    required this.time,
  });

  final String taskName;
  final String time;
  final String taskSubtitle;

  // final bool checkedBoxValue;
  final Function(BuildContext?)? deleteTask;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteTask,
          icon: Icons.delete_outline,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.only(left: 10),
          borderRadius: BorderRadius.circular(25),
        )
      ]),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            taskName,
            style: MyTextStyle.latoSize30WeightBold.copyWith(fontSize: 25).copyWith(
                // decoration: checkedBoxValue ? TextDecoration.lineThrough : null
                ),
          ),
          subtitle: Text(
            taskSubtitle ?? 'No Description',
            style: MyTextStyle.latoSize30WeightBold
                .copyWith(fontSize: 16, color: Colors.grey),
          ),
          trailing: Text(
            time,
            style: MyTextStyle.latoSize30WeightBold.copyWith(fontSize: 25),
          ),
        ),
      ),
    );
  }
}

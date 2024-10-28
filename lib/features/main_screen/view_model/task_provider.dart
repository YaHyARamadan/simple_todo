import 'package:flutter/material.dart';

class TaskProvider extends ChangeNotifier {
  final TextEditingController task = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController time = TextEditingController();

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





}

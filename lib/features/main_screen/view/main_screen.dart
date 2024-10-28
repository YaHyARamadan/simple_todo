import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/main_screen/view/widgets/todo_body.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/strings.dart';
import '../../../core/core_widgets/custom_text.dart';
import '../../../core/core_widgets/custom_text_form.dart';
import '../../../core/styles/my_text_style.dart';
import '../../../core/theme/theme_provider.dart';
import '../view_model/task_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    var provider = Provider.of<TaskProvider>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.secondary,
        tooltip: 'Add New Task',
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            backgroundColor: theme.surface,
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 10),
                      const CustomText(
                          text: 'Add Task',
                          style: MyTextStyle.latoSize30WeightBold),
                      const SizedBox(height: 10),
                      CustomTextForm(
                        title: 'Task',
                        textInputType: TextInputType.text,
                        textEditingController: provider.task,
                      ),
                      CustomTextForm(
                        title: 'Description of Task',
                        textInputType: TextInputType.text,
                        textEditingController: provider.description,
                      ),
                      CustomTextForm(
                        title: 'Start Time',
                        textInputType: TextInputType.datetime,
                        textEditingController: provider.time,
                        suffixIcon: IconButton(
                          onPressed: () {
                            provider.getTimeFromUser(context);
                          },
                          icon: const Icon(Icons.access_time),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: CustomText(
                              text: 'Cancel',
                              style: MyTextStyle.latoSize30WeightBold.copyWith(
                                  color: theme.primary, fontSize: 19),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              provider.addTask(
                                task: provider.task.text,
                                description: provider.description.text,
                                time: provider.time.text,
                              );
                              Navigator.pop(context);
                            },
                            child: CustomText(
                              text: 'Add Task',
                              style: MyTextStyle.latoSize30WeightBold.copyWith(
                                  color: theme.primary, fontSize: 19),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      backgroundColor: theme.background,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggle();
          },
          icon: const Icon(
            Icons.dark_mode_outlined,
            size: 30,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.account_circle_outlined,
              size: 35,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 13, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: DateFormat.yMMMMd().format(DateTime.now()),
                        style: MyTextStyle.latoSize30WeightBold
                            .copyWith(fontSize: 24, color: Colors.grey)),
                    const CustomText(
                        text: MyStrings.today,
                        style: MyTextStyle.latoSize30WeightBold),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, top: 8),
            child: DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              width: 80,
              height: 100,
              selectionColor: theme.secondary, // Selection color
              selectedTextColor: theme.onSecondary, // Text color when selected
              dateTextStyle: MyTextStyle.latoSize30WeightBold
                  .copyWith(fontSize: 18, color: theme.primary),
              dayTextStyle: MyTextStyle.latoSize18WeightBoldGrey,
              monthTextStyle: MyTextStyle.latoSize18WeightBoldGrey,
              onDateChange: (date) {},
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              child: ListView.builder(
                  itemCount: provider.getTasks.length,
                  itemBuilder: (context, index) {
                    final todo = provider.getTasks[index];
                    return ToDoList(
                      taskName: todo.task,
                      taskSubtitle: todo.description,
                      time: todo.time,
                      deleteTask: (context) => provider.deleteTask(index),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

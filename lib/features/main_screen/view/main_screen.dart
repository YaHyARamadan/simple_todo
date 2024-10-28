import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/features/main_screen/view/widgets/add_task_button.dart';
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
        backgroundColor: MyColors.purpleColor,
        tooltip: 'Add New Task',
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            backgroundColor: Colors.white,
            context: context,
            builder: (BuildContext context) {
              return Column(
                children: [
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
                    suffixIcon: IconButton(onPressed: (){
                      provider.getTimeFromUser(context);
                    }, icon: const Icon(Icons.access_time),)
                  ),

                ],
              );
            },
          );
        },
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
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
              selectionColor: MyColors.purpleColor,
              selectedTextColor: MyColors.whiteColor,
              dateTextStyle: MyTextStyle.latoSize30WeightBold
                  .copyWith(fontSize: 18, color: MyColors.grayColor),
              dayTextStyle: MyTextStyle.latoSize18WeightBoldGrey,
              monthTextStyle: MyTextStyle.latoSize18WeightBoldGrey,
              onDateChange: (date) {},
            ),
          ),
        ],
      ),
    );
  }
}

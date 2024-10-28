
import 'package:flutter/material.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/routes/routes.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width * 0.7,
          height: MediaQuery.sizeOf(context).height * 0.09,
          decoration: BoxDecoration(
            color: MyColors.purpleColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            title,
            style: const TextStyle(color: MyColors.whiteColor, fontSize: 18),
          )),
    );
  }
}

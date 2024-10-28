import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../styles/my_text_style.dart';

class CustomTextForm extends StatefulWidget {
  final String title;
  final String? hint;
  final TextEditingController? textEditingController;
  final TextInputType textInputType;
  final int? maxNum;
  final IconButton? suffixIcon;
  const CustomTextForm(
      {super.key,
      required this.title,
       this.textEditingController,
      required this.textInputType,
      this.maxNum, this.hint, this.suffixIcon});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  final FocusNode nameFocusNode = FocusNode();
  final FocusNode idFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: MyTextStyle.latoSize30WeightBold.copyWith(fontSize: 18)
          ),
          const SizedBox(height: 5.0),
          TextFormField(
            readOnly: widget.suffixIcon== null ? false:true,
            focusNode: FocusNode(),
            controller: widget.textEditingController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Empty Valid';
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: widget.suffixIcon,
              filled: true,
              fillColor: MyColors.whiteColor,
              hintText:  widget.hint  ?? 'Enter Your ${widget.title} Here',
              hintStyle: MyTextStyle.latoSize18WeightBoldGrey,
              border:  const OutlineInputBorder(
                borderSide: BorderSide(width: 1,color: MyColors.grayColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              ),
              focusedBorder:  const OutlineInputBorder(
                borderSide: BorderSide(width: 2,color: MyColors.blackColor),
                borderRadius: BorderRadius.all(
                  Radius.circular(8.0),
                ),
              )
            ),
            keyboardType: widget.textInputType,
            maxLength: widget.maxNum,
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_field.dart';

class AppTitledTextField extends StatelessWidget {
  const AppTitledTextField(
      {super.key,
      required this.title,
      this.hinttext,
      this.height,
      this.width,
      this.maxlines,
      this.controller,
      required this.edit});
  final String title;
  final String? hinttext;
  final double? height;
  final double? width;
  final int? maxlines;
  final TextEditingController? controller;
  final bool edit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BodyText(
            text: title,
            fontWeight: FontWeight.w600,
          ),
          AppTextField(
            edit: edit,
            maxlines: maxlines,
            hintText: hinttext,
            value: controller,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AppTextButton1 extends StatelessWidget {
  const AppTextButton1(
      {super.key,
      required this.label,
       this.decoration,
      required this.function,
      this.textsize,
      this.textcolor});
  final String label;
  final VoidCallback function;
  final double? textsize;
  final Color? textcolor;
  final TextDecoration? decoration;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      hoverColor: AppColors.themeColor,
      child: SmallBodyText(
        text: label,
        decoration: decoration,
        size: textsize,
        color: textcolor ?? AppColors.complementColor,
      ),
    );
  }
}

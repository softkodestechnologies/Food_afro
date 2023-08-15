import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AppButton1 extends StatelessWidget {
  const AppButton1(
      {super.key,
      required this.label,
      required this.function,
      this.height,
      this.width, this.widget});
  final String label;
  final VoidCallback function;
  final double? height;
  final double? width;
  final Widget? widget;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      hoverColor: AppColors.themeColor,
      child: Container(
          width: width ?? 100,
          height: height ?? 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.complementColor,
          ),
          alignment: Alignment.center,
          child: widget??SmallBodyText(
            text: label,
            color: Colors.white,
          )),
    );
  }
}
//

class AppButton2 extends StatelessWidget {
  const AppButton2(
      {super.key,
      required this.label,
      required this.function,
      this.height,
      this.width});
  final String label;
  final VoidCallback function;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      hoverColor: AppColors.complementColor,
      child: Container(
          width: width ?? 100,
          height: height ?? 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.themeColor,
              border: Border.all(
                color: AppColors.complementColor,
              )),
          alignment: Alignment.center,
          child: SmallBodyText(
            text: label,
            color: AppColors.complementColor,
          )),
    );
  }
}

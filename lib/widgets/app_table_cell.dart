import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AppTableCell extends StatelessWidget {
  const AppTableCell({
    super.key,
    this.width,
    required this.label,
    //  required this.borderLeft,
    //  required this.borderTop,
    required this.borderBottom,
    //  required this.borderRight,
    this.widget,
    this.height,
    this.align,
    this.paddingDouble,
    this.color,
    this.fontSize,
    this.margin,
    this.fontWeight,
    this.textAlign,
    this.textcolor,
    this.maxline,
  });
  // final bool borderLeft;
  // final bool borderTop;
  final bool borderBottom;
  // final bool borderRight;
  final AlignmentGeometry? align;
  final int? maxline;
  final double? paddingDouble;
  final double? fontSize;
  final double? width;
  final double? height;
  final String label;
  final Color? color;
  final Color? textcolor;
  final Widget? widget;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? margin;
  final bordercolor = const BorderSide(color: AppColors.textgray);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        border: Border(
          bottom: borderBottom ? bordercolor : BorderSide.none,
          // top: borderTop ? bordercolor : BorderSide.none,
          // left: borderLeft ? bordercolor : BorderSide.none,
          // right: borderRight ? bordercolor : BorderSide.none,
        ),
      ),
      alignment: align ?? Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: paddingDouble ?? 3),
      width: width ?? 50,
      height: height ?? 50,
      child: widget ??
          BodyText(
            text: label,
            textAlign: textAlign,
            fontWeight: fontWeight ?? FontWeight.w400,
            size: fontSize,
            color: color ?? Colors.black,
            maxLines: maxline,
          ),
    );
  }
}

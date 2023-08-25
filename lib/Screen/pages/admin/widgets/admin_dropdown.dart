import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AdminDropDown extends StatefulWidget {
  const AdminDropDown(
      {super.key,
      required this.value,
      required this.listItems,
      this.width,
      this.height,
      this.textBlack,
      this.boldText,
      this.function,
      this.color, this.title, this.containercolor, this.titlecolor});

  final double? width;
  final double? height;
  final String? title;
  final String value;
  final List<String> listItems;
  final bool? textBlack;

  final bool? boldText;
  final Function(String)? function;
  final Color? color;
    final Color? containercolor;
   final Color? titlecolor;
  @override
  State<AdminDropDown> createState() => _AdminDropDownState();
}

class _AdminDropDownState extends State<AdminDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 35,
      width: widget.width ?? 160,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.containercolor??  Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
         BodyText(
          text:widget.title??'Showing: ',
          color: widget.titlecolor?? AppColors.textgray,
        ),
        DropdownButton(
          // dropdownColor: AppColors.themeColor,
          underline: const SizedBox(),
          iconSize: 15,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
          elevation: 0,
          // isExpanded: true,
          value: widget.value,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
          items: widget.listItems.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: BodyText(
                text: items,
                color: widget.color,
                fontWeight: FontWeight.w300,
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              widget.function?.call(newValue!);
            });
          },
        ),
      ]),
    );
  }
}

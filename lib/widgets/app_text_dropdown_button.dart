import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

// ignore: must_be_immutable
class TextDropDown extends StatefulWidget {
  TextDropDown({
    super.key,
    required this.value,
    required this.listItems,
    this.width,
    this.textBlack,
    this.boldText,
    this.height,
    this.function,
    this.color,
  });

  final double? width;
  final double? height;
  String value;
  List<String> listItems;
  final bool? textBlack;
  final bool? boldText;
  final Function(String)? function;
  final Color? color;
  @override
  State<TextDropDown> createState() => _TextDropDownState();
}

class _TextDropDownState extends State<TextDropDown> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height ?? 35,
      width: widget.width ?? 100,
      child: DropdownButton(
        dropdownColor: AppColors.themeColor,
        underline: const SizedBox(),
        iconSize: 15,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
        elevation: 0,
        isExpanded: true,
        value: widget.value,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
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
            widget.value = newValue!;
          });
        },
      ),
    );
  }
}

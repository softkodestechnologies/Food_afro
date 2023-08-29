import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField(
      {super.key,
      this.value,
      this.onChanged,
      required this.edit,
      this.onTap,
      this.fontsize,
      this.maxlines,
      this.hintText});
  final TextEditingController? value;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final bool edit;
  final double? fontsize;
  final int? maxlines;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      // style: AppFont.contentText,
      controller: value,
      onChanged: onChanged,
      onTap: onTap,
      enabled: edit,
      maxLines: maxlines,
      style: TextStyle(
        fontFamily: 'Satoshi',
        fontSize: fontsize ?? 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

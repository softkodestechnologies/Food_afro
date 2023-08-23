import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AdminWelcomeBar1 extends StatelessWidget {
  const AdminWelcomeBar1(
      {super.key, required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBoldText(text: title),
          const SizedBox(height: 8),
          BodyText(
            text: detail,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

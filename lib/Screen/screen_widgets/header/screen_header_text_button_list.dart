import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class ScreenHeaderTextButtonList extends StatelessWidget {
  const ScreenHeaderTextButtonList(
      {super.key,
      required this.title,
      required this.labels,
      required this.functions});
  final String title;
  final List<String> labels;
  final List<VoidCallback> functions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 115,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: title),
          const SizedBox(height: 20),
          for (var i = 0; i < labels.length; i++)
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                onTap: functions[i],
                child: SmallBodyText(text: labels[i]),
              ),
            )
        ],
      ),
    );
  }
}

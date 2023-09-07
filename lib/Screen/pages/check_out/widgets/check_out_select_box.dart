import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class CheckOutSelectBox extends StatelessWidget {
  const CheckOutSelectBox(
      {super.key,
      required this.title,
      required this.description,
      required this.selected,
      required this.function});
  final String title;
  final String description;
  final bool selected;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    // bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
    //     ResponsiveScreenView.isTablet(context));
    bool tablet = ResponsiveScreenView.isTablet(context);
    bool desktop = ResponsiveScreenView.isDesktop(context);
    return InkWell(
      onTap: function,
      child: Container(
        height: 80,
        width: desktop
            ? media.width * .24
            : tablet
                ? media.width * .42
                : media.width * .9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: selected ? AppColors.complementColor : AppColors.textgray,
          ),
        ),
        padding: const EdgeInsets.all(9),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (selected)
            Checkbox(
              value: selected,
              onChanged: (value) {},
            ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyMediumText(
                text: title,
                color: AppColors.textBlack,
              ),
              BodyText(
                text: description,
                color: AppColors.textgray,
              )
            ],
          )
        ]),
      ),
    );
  }
}

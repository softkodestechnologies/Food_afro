import 'package:flutter/material.dart';

import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class FilterCheckBox1 extends StatelessWidget {
  FilterCheckBox1({
    Key? key,
    required this.label,
    required this.count,
    required this.onchange,
    required this.values,
  }) : super(key: key);
  final String label;
  final int count;
  bool values;
  final Function(bool?) onchange;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool mobile = (ResponsiveScreenView.isMobile(context));
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Checkbox(value: values, onChanged: onchange),
        SizedBox(
          width: mobile
              ? (media.width < 300 ? media.width * .55 : (media.width * .63))
              : 110,
          child: BodyText(
            text: label,
            size: 13,
          ),
        ),
        Container(
          alignment: Alignment.center,
          height: 25,
          width: count > 99 ? 50 : 25,
          decoration: const BoxDecoration(
            color: AppColors.themeColor2,
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
          child: BodyText(
            text: count.toString(),
            size: 13,
          ),
        )
      ]),
    );
  }
}

////////////////////////////
///
///
///
class FilterCheckBox2 extends StatelessWidget {
  FilterCheckBox2({
    Key? key,
    required this.label,
    required this.onchange,
    required this.values,
  }) : super(key: key);
  final String label;

  bool values;
  final Function(bool?) onchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        Checkbox(value: values, onChanged: onchange),
        SizedBox(
          width: 120,
          child: BodyText(
            text: label,
            size: 13,
          ),
        ),
      ]),
    );
  }
}

//

class FilterCheckBox3 extends StatelessWidget {
  FilterCheckBox3(
      {super.key,
      required this.stars,
      required this.onchange,
      required this.values});

  final int stars;
  final Function(bool?) onchange;
  bool values;
  @override
  Widget build(BuildContext context) {
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(children: [
        Checkbox(value: values, onChanged: onchange),
        const SizedBox(width: 10),
        SizedBox(
          width: 120,
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                (stars >= 1) ? Icons.star : Icons.star_border_outlined,
                size: 20,
                color: AppColors.starColor,
              ),
              Icon(
                (stars >= 2) ? Icons.star : Icons.star_border_outlined,
                size: 20,
                color: AppColors.starColor,
              ),
              Icon(
                (stars >= 3) ? Icons.star : Icons.star_border_outlined,
                size: 20,
                color: AppColors.starColor,
              ),
              Icon(
                (stars >= 4) ? Icons.star : Icons.star_border_outlined,
                size: 20,
                color: AppColors.starColor,
              ),
              Icon(
                (stars == 5) ? Icons.star : Icons.star_border_outlined,
                size: 20,
                color: AppColors.starColor,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}

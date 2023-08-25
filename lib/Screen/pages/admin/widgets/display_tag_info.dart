import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class DisplayTagInfo extends StatelessWidget {
  const DisplayTagInfo(
      {super.key,
      required this.image,
      required this.value,
      required this.title,
      this.hight,
      this.width});
  final String image;
  final String value;
  final String title;
  final double? hight;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: hight,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(10),
      child: Row(children: [
        SvgPicture.asset(
          image,
          clipBehavior: Clip.hardEdge,
          fit: BoxFit.fitHeight,
          height: 70,
          width: 25,
        ),
        const SizedBox(width: 5),
        SizedBox(
          height: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                text: title,
                fontWeight: FontWeight.w400,
                color: AppColors.textgray,
              ),
              const SizedBox(height: 8),
              BodyMediumText(
                text: value,
                color: Colors.black,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

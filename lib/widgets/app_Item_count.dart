import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AppItemCount1 extends StatelessWidget {
  const AppItemCount1({
    super.key,
    required this.lablel,
    required this.image,
    required this.count,
  });
  final String lablel;
  final String image;
  final double count;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(children: [
        BodyText(
          text: lablel,
          fontWeight: FontWeight.w400,
          size: 16,
        ),
        const SizedBox(width: 3),
        SvgPicture.asset(
          image,
          height: 20,
          width: 20,
        ),
        const SizedBox(width: 3),
        BodyMediumText(
          text: '($count)',
          size: 16,
        )
      ]),
    );
  }
}

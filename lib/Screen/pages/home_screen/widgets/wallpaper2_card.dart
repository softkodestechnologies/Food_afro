import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class HomeWallpaper2Card extends StatelessWidget {
  const HomeWallpaper2Card(
      {super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return SizedBox(
      width: widescreen ? 250 : 200,
      height: 260,
      child: Column(children: [
        SvgPicture.asset(image, fit: BoxFit.contain),
        const SizedBox(height: 20),
        BodyText(
          text: text,
          size: 15,
          maxLines: 7,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';

class HomeCategoryCard extends StatelessWidget {
  const HomeCategoryCard(
      {super.key, required this.image, required this.function});
  final String image;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      color: AppColors.themeColor,
      child: InkWell(
        onTap: function,
        child: SvgPicture.asset(
          image, theme: SvgTheme(currentColor: AppColors.complementColor),
          // width: widescreen ? 200 : 100,
          // height: widescreen ? 230 : 130,

          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

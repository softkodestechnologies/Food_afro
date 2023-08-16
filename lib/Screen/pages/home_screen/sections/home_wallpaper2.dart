import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class HomeScreenWallpaper2Section extends StatelessWidget {
  const HomeScreenWallpaper2Section({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    return Container(
      clipBehavior: Clip.hardEdge,
      height: widescreen ? 450 : 750,
      width: media.width * .9,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.themeColor,
        borderRadius: BorderRadius.circular(widescreen ? 34 : 20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: media.width * .9,
              height: 130,
              child: SvgPicture.asset(
                widescreen
                    ? 'assets/images/dasktop_tl.svg'
                    : 'assets/images/mobile_wallpaper_tp.svg',
                fit: BoxFit.cover,
              )),
          Container(
            width: media.width * .8,
            height: widescreen ? 320 : 520,
            margin: EdgeInsets.symmetric(
              // vertical: 20,
              horizontal: media.width * .05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBoldText(
                    text: 'Our flexible delivery options',
                    size: widescreen ? null : 17),
                SizedBox(
                  width: media.width * .4,
                  child: BodyText(
                    text:
                        'Experience the convenience of our versatile delivery choices tailored to suit your specific needs.',
                    maxLines: 4,
                  ),
                )
              ],
            ),
          ),
          if (!widescreen)
            SizedBox(
                width: media.width * .9,
                height: 100,
                child: SvgPicture.asset(
                  'assets/images/mobile_wallpaper_bl.svg',
                  fit: BoxFit.cover,
                )),
        ],
      ),
    );
  }
}

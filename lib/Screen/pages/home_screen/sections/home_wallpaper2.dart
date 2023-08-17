import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/widgets/wallpaper2_card.dart';
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
      height: widescreen ? 550 : 880,
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
            height: widescreen ? 420 : 650,
            margin: EdgeInsets.symmetric(
              // vertical: 20,
              horizontal: media.width * .05,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                HeaderBoldText(
                    text: 'Our flexible delivery options',
                    size: widescreen ? null : 17),
                SizedBox(
                  width: widescreen ? media.width * .5 : double.infinity,
                  child: const BodyText(
                    text:
                        'Experience the convenience of our versatile delivery choices tailored to suit your specific needs.',
                    maxLines: 4,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: widescreen ? 230 : 524,
                  width: double.infinity,
                  alignment: Alignment.center,
                  // padding: const EdgeInsets.only(top: 10),
                  child: widescreen
                      ? const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HomeWallpaper2Card(
                                image: 'assets/images/house.svg',
                                text:
                                    'Experience the  convenience with our shopping solution. Browse and shop from the comfort of your home, then visit our store to handpick the exact items you desire.'),
                            HomeWallpaper2Card(
                                image: 'assets/images/personShopping.svg',
                                text:
                                    'Discover unmatched convenience through our home shopping experience. Our dedicated staff carefully handpicks items for you, delivering them directly to your doorstep.')
                          ],
                        )
                      : const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HomeWallpaper2Card(
                                image: 'assets/images/house.svg',
                                text:
                                    'Experience the  convenience with our shopping solution. Browse and shop from the comfort of your home, then visit our store to handpick the exact items you desire.'),
                            HomeWallpaper2Card(
                                image: 'assets/images/personShopping.svg',
                                text:
                                    'Discover unmatched convenience through our home shopping experience. Our dedicated staff carefully handpicks items for you, delivering them directly to your doorstep.')
                          ],
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

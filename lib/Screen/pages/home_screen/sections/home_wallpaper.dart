import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_search_bar.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class HomeScreenWallpaperSection extends StatelessWidget {
  const HomeScreenWallpaperSection({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    final searchbar = AppSearchBar1(
      suggestions: ['Garri'],
      searchQuery: 'Garri',
      width: widescreen ? 450 : media.width * .65,
    );
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 500,
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
            alignment: widescreen ? Alignment.centerLeft : Alignment.center,
            padding: widescreen
                ? const EdgeInsets.only(left: 40)
                : const EdgeInsets.symmetric(horizontal: 3),
            height: 230,
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 185,
                    width: widescreen ? 400 : media.width * .7,
                    child: HeroTitleText(
                        text:
                            'Get high quality and fresh Nigerian food  stuff and ingredients.',
                        maxLines: 5,
                        size: widescreen ? 30 : 25,
                        softWrap: true),
                  ),
                  searchbar,
                ]),
          ),
          SizedBox(
              width: media.width * .9,
              height: 100,
              child: SvgPicture.asset(
                widescreen
                    ? 'assets/images/desktop_bl.svg'
                    : 'assets/images/mobile_wallpaper_bl.svg',
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}

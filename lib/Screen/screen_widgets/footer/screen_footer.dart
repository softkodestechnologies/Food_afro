import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';

class ScreenFooter extends StatelessWidget {
  const ScreenFooter({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    // bool mobile = ResponsiveScreenView.isMobile(context);
    return Container(
      alignment: Alignment.center,
      height: widescreen ? 300 : 750,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ////////////////////////////////  main bar
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            height: widescreen ? 250 : 700,
            color: AppColors.themeColor,
            child: widescreen
                ? const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FooterInfoBox(),
                      Spacer(),
                      FooterNavigation(),
                      SizedBox(width: 20),
                      FooterOpeningHours(),
                      SizedBox(width: 20),
                      FooterContactUs()
                    ],
                  )
                : const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FooterInfoBox(),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FooterNavigation(),
                          FooterOpeningHours(),
                        ],
                      ),
                      SizedBox(height: 20),
                      FooterContactUs()
                    ],
                  ),
          ),

          ////////////////////////////// brown bar
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: media.width * .05),
            alignment: Alignment.center,
            height: 50,
            color: AppColors.touchColor,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BodyText(
                    text: 'All right reserved, Food afro-bean 2023',
                    color: Colors.white,
                    size: widescreen ? 14 : 10,
                  ),
                  if (widescreen)
                    SizedBox(
                      width: 50,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppImageIconButton(
                                image: 'assets/images/facebook.svg',
                                function: () {}),
                            AppImageIconButton(
                                image: 'assets/images/twitter.svg',
                                function: () {}),
                          ]),
                    ),
                  if (!widescreen)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppImageIconButton(
                            image: 'assets/images/facebook.svg',
                            function: () {}),
                        const SizedBox(width: 15),
                        AppImageIconButton(
                            image: 'assets/images/twitter.svg',
                            function: () {}),
                      ],
                    )
                ]),
          )
        ],
      ),
    );
  }
}

class FooterInfoBox extends StatelessWidget {
  const FooterInfoBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 60,
            height: 30,
            child: SvgPicture.asset('assets/images/logo.svg'),
          ),
          const SizedBox(height: 15),
          const SmallBodyText(
            text:
                'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis. ',
            maxLines: 6,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}

class FooterNavigation extends StatelessWidget {
  const FooterNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(text: 'Navigation'),
          const SizedBox(height: 10),
          AppTextButton1(label: 'HOME', function: () {}),
          const SizedBox(height: 10),
          AppTextButton1(label: 'CART', function: () {}),
          const SizedBox(height: 10),
          AppTextButton1(label: 'ORDER', function: () {}),
          const SizedBox(height: 10),
          AppTextButton1(label: 'RECIPE', function: () {}),
          const SizedBox(height: 10),
          AppTextButton1(label: 'DELIVERY', function: () {}),
          const SizedBox(height: 10),
          AppTextButton1(label: 'CATERGORY', function: () {}),
        ],
      ),
    );
  }
}

class FooterOpeningHours extends StatelessWidget {
  const FooterOpeningHours({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 130,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: 'Opening Hours'),
          SizedBox(height: 10),
          SmallBodyText(text: 'MON - WED', fontWeight: FontWeight.w500),
          SizedBox(height: 10),
          SmallBodyText(
            text: '10:00AM - 7:00PM',
          ),
          SizedBox(height: 20),
          SmallBodyText(text: 'SAT - SUN', fontWeight: FontWeight.w500),
          SizedBox(height: 10),
          SmallBodyText(
            text: '2:00PM - 5:00PM',
          ),
        ],
      ),
    );
  }
}

class FooterContactUs extends StatelessWidget {
  const FooterContactUs({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleText(text: 'Contact us'),
          SizedBox(height: 10),
          SmallBodyText(text: 'Address', fontWeight: FontWeight.w500),
          SizedBox(height: 10),
          SmallBodyText(text: '101 wagma st, mitchigan'),
          SizedBox(height: 20),
          SmallBodyText(text: 'Email Address', fontWeight: FontWeight.w500),
          SizedBox(height: 10),
          SmallBodyText(text: 'foodafrobean@gmail.com'),
        ],
      ),
    );
  }
}

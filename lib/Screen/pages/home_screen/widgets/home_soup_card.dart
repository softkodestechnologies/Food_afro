import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class HomeSoupCard extends StatelessWidget {
 const HomeSoupCard(
      {super.key,
      required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.fav,
      required this.favourite});
  final String id;
  final String image;
  final String title;
  final String description;
 final bool fav;
  final VoidCallback favourite;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    double width = widescreen ? 220 : media.width * .45;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 200,
      width: width,
      child: Stack(alignment: Alignment.topCenter, children: [
        Positioned(
          bottom: 0,
          child: Container(
            width: width,
            height: 150,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.backgroundGray,
              borderRadius: BorderRadius.circular(3),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Spacer(),
              TitleText(
                text: title,
                size: widescreen ? null : 14,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: media.width <= 280 ? 88 : width - 56,
                      child: BodyText(
                        text: description,
                        maxLines: 5,
                        size: widescreen ? null : 12,
                      )),
                  if (media.width >= 290) const SizedBox(width: 10),
                  AppImageIconButton(
                    image: fav
                        ? 'assets/images/fav_red.svg'
                        : 'assets/images/fav_borderline.svg',
                    size: 30,
                    function: favourite,
                  )
                ],
              ),
            ]),
          ),
        ),
        Positioned(
          top: 0,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: 80,
            width: 80,
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.complementColor),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),
        )
      ]),
    );
  }
}

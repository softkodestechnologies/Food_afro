import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AppProductDisplayCard extends StatefulWidget {
  const AppProductDisplayCard({
    super.key,
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.stars,
    required this.addToCart, required this.isfavourite,
  });
  final String id;
  final String image;
  final String title;
  final String description;
  final double price;
  final double stars;
  final VoidCallback addToCart;
  final VoidCallback isfavourite;

  @override
  State<AppProductDisplayCard> createState() => _AppProductDisplayCardState();
}

class _AppProductDisplayCardState extends State<AppProductDisplayCard> {
  // bool expand = false;
  double _containerHeight = 450.0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = (ResponsiveScreenView.isDesktop(context));
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    // void _expandContainer() {
    //   setState(() {
    //     _containerHeight = 550.0;
    //   });
    // }

    // void _shrinkContainer() {
    //   setState(() {
    //     _containerHeight = 450.0;
    //   });
    // }

    return InkWell(
      onHover: (isHovered) {
        // if (isHovered) {
        //   _expandContainer();
        // } else {
        //   _shrinkContainer();
        // }
      },
      onTap: () {
        //
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        // color: expand ? AppColors.themeColor : null,
        height: _containerHeight, //? 550 : 450,
        // margin: const EdgeInsets.symmetric(horizontal: 5),
        width: widescreen ? 200 : media.width * .35,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              ///change to image network later this is for test use only
              width: widescreen ? 200 : media.width * .35,
              height: 300,
              child: Image.asset(widget.image, fit: BoxFit.fill),
            ),
            const SizedBox(height: 10),
            TitleText(text: widget.title),
            const SizedBox(height: 10),
            BodyText(
              text: widget.description,
              color: AppColors.textgray,
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            TitleText(
                text: '\$ ${widget.price}', color: AppColors.complementColor),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  (widget.stars >= 1) ? Icons.star : Icons.star_border_outlined,
                  size: 15,
                  color: AppColors.starColor,
                ),
                Icon(
                  (widget.stars >= 2) ? Icons.star : Icons.star_border_outlined,
                  size: 15,
                  color: AppColors.starColor,
                ),
                Icon(
                  (widget.stars >= 3) ? Icons.star : Icons.star_border_outlined,
                  size: 15,
                  color: AppColors.starColor,
                ),
                Icon(
                  (widget.stars >= 4) ? Icons.star : Icons.star_border_outlined,
                  size: 15,
                  color: AppColors.starColor,
                ),
                Icon(
                  (widget.stars == 5) ? Icons.star : Icons.star_border_outlined,
                  size: 15,
                  color: AppColors.starColor,
                ),
              ],
            ),
            if (!desktop) const SizedBox(height: 10),
            if (!desktop)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton1(
                    label: '',
                    function: widget.addToCart,
                    widget: Row(children: [
                      const SmallBodyText(
                        text: 'Add to Cart',
                        color: Colors.white,
                      ),
                      // AppImageIconButton(image: image, function: function)
                    ]),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}

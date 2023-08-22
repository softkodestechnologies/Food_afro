import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    required this.fav,
    required this.onClick,
    required this.addToCart,
    required this.isfavourite,
  });
  final String id;
  final String image;
  final String title;
  final String description;
  final double price;
  final double stars;
  final bool fav;
  final VoidCallback onClick;
  final VoidCallback addToCart;
  final VoidCallback isfavourite;

  @override
  State<AppProductDisplayCard> createState() => _AppProductDisplayCardState();
}

class _AppProductDisplayCardState extends State<AppProductDisplayCard> {
  // bool expand = false;
  double _onhoverheight = 460.0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = (ResponsiveScreenView.isDesktop(context));
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    double _containerHeight = desktop
        ? _onhoverheight
        : widescreen
            ? 480.0
            : 410;

    void _expandContainer() {
      setState(() {
        _onhoverheight = 500.0;
      });
    }

    void _shrinkContainer() {
      setState(() {
        _onhoverheight = 460.0;
      });
    }

    return InkWell(
      onHover: (isHovered) {
        if (isHovered) {
          _expandContainer();
        } else {
          _shrinkContainer();
        }
      },
      onTap: () {
        // navigate to product card with id as tag
      },
      child: Container(
        // color: expand ? AppColors.themeColor : null,
        height: _containerHeight, //? 550 : 450,
        margin: const EdgeInsets.only(top: 15),
        width: widescreen ? 220 : media.width * .45,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: widget.onClick,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        ///change to image network later this is for test use only

                        height: widescreen ? 270 : 200,
                        child: Image.asset(
                          widget.image,
                          fit: BoxFit.fill,
                          // width: 200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TitleText(
                      text: widget.title,
                      size: widescreen ? null : 14,
                    ),
                    const SizedBox(height: 10),
                    BodyText(
                      text: widget.description,
                      color: AppColors.textgray,
                      maxLines: 2,
                      size: widescreen ? null : 12,
                    ),
                    const SizedBox(height: 10),
                    TitleText(
                        text: '\$ ${widget.price}',
                        color: AppColors.complementColor),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          (widget.stars >= 1)
                              ? Icons.star
                              : Icons.star_border_outlined,
                          size: widescreen ? 19 : 16,
                          color: AppColors.starColor,
                        ),
                        Icon(
                          (widget.stars >= 2)
                              ? Icons.star
                              : Icons.star_border_outlined,
                          size: widescreen ? 19 : 16,
                          color: AppColors.starColor,
                        ),
                        Icon(
                          (widget.stars >= 3)
                              ? Icons.star
                              : Icons.star_border_outlined,
                          size: widescreen ? 19 : 16,
                          color: AppColors.starColor,
                        ),
                        Icon(
                          (widget.stars >= 4)
                              ? Icons.star
                              : Icons.star_border_outlined,
                          size: widescreen ? 19 : 16,
                          color: AppColors.starColor,
                        ),
                        Icon(
                          (widget.stars == 5)
                              ? Icons.star
                              : Icons.star_border_outlined,
                          size: widescreen ? 19 : 16,
                          color: AppColors.starColor,
                        ),
                      ],
                    ),
                  ]),
            ),
            const SizedBox(height: 10),
            if (_containerHeight != 460)
              media.width <= 280
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppButton1(
                          label: '',
                          function: widget.addToCart,
                          width: 105,
                          height: 27,
                          widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/bag22.svg'),
                                const SizedBox(width: 3),

                                const SmallBodyText(
                                  text: 'Add to Cart',
                                  color: Colors.white,
                                ),
                                // AppImageIconButton(image: image, function: function)
                              ]),
                        ),
                        const SizedBox(height: 5),
                        AppImageIconButton(
                            image: widget.fav
                                ? 'assets/images/fav_red.svg'
                                : 'assets/images/fav_borderline.svg',
                            function: widget.isfavourite)
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppButton1(
                          label: '',
                          function: widget.addToCart,
                          width: 110,
                          widget: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset('assets/images/bag22.svg'),
                                const SizedBox(width: 3),

                                const SmallBodyText(
                                  text: 'Add to Cart',
                                  color: Colors.white,
                                ),
                                // AppImageIconButton(image: image, function: function)
                              ]),
                        ),
                        const SizedBox(width: 10),
                        AppImageIconButton(
                          image: widget.fav
                              ? 'assets/images/fav_red.svg'
                              : 'assets/images/fav_borderline.svg',
                          size: 30,
                          function: widget.isfavourite,
                        )
                      ],
                    )
          ],
        ),
      ),
    );
  }
}

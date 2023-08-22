import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class ProductItemDetailsCard extends StatelessWidget {
  const ProductItemDetailsCard(
      {super.key,
      required this.title,
      required this.description,
      required this.price,
      this.discountedPrice,
      required this.noOfreviews,
      required this.keyfeatures,
      required this.buynow,
      required this.addtocart,
      this.width,
      required this.discount});
  final String title;
  final String description;
  final String price;
  final String? discountedPrice;
  final List<String>? noOfreviews;
  final double? width;
  final bool discount;
  final List<String>? keyfeatures;
  final VoidCallback buynow;
  final VoidCallback addtocart;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    return SizedBox(
      width: widescreen ? width ?? 370 : media.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBoldText(
            text: title,
          ),
          const SizedBox(height: 10),
          BodyText(text: description, maxLines: 7),
          const SizedBox(height: 20),
          Row(
            children: [
              HeroTitleText(
                text: '\$ $price',
                decoration: discount ? TextDecoration.lineThrough : null,
              ),
              const SizedBox(width: 10),
              BodyText(
                text: '\$ $discountedPrice',
                color: Colors.black,
                size: 14,
              )
            ],
          ),
          const SizedBox(height: 10),
          BodyText(
            text: '(${noOfreviews!.length} noOfreviews)',
            decoration: TextDecoration.underline,
          ),
          const SizedBox(height: 20),
          AppButton1(label: 'Buy now', function: buynow),
          const SizedBox(height: 10),
          AppButton2(
            label: '',
            function: addtocart,
            widget: Row(children: [
              SvgPicture.asset('assets/images/bag22.svg'),
              const SizedBox(width: 3),
              const SmallBodyText(
                text: 'Add to Cart',
                color: Colors.white,
              ),
            ]),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';

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
      required this.discount,
      required this.returnpolicy,
      required this.samedaydelivery});
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
  final VoidCallback returnpolicy;
  final VoidCallback samedaydelivery;

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
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              HeroTitleText(
                text: '£ $price',
                size: 20,
                decoration: discount ? TextDecoration.lineThrough : null,
              ),
              const SizedBox(width: 10),
              BodyText(
                text: '£ $discountedPrice',
                color: Colors.black,
                size: 14,
              )
            ],
          ),
          const SizedBox(height: 10),
          BodyText(
            text: '(${noOfreviews!.length} no of reviews)',
            decoration: TextDecoration.underline,
            color: AppColors.textgray,
          ),

          const SizedBox(height: 20),

          const BodyMediumText(
              text: 'Key Features', size: 20, color: Colors.black),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: keyfeatures!
                .map((e) => Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      child: SmallBodyText(
                        text: '\u2022 ${e}',
                        maxLines: 3,
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          //////////////
          AppButton1(
              label: 'Buy now',
              function: buynow,
              width: widescreen ? width ?? 370 : media.width * .9),
          const SizedBox(height: 10),
          AppButton2(
            label: '',
            width: widescreen ? width ?? 370 : media.width * .9,
            function: addtocart,
            widget: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset('assets/images/bag2.svg'),
              const SizedBox(width: 3),
              const SmallBodyText(
                text: 'Add to Cart',
                color: AppColors.complementColor,
              ),
            ]),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextButton1(
                label: 'Return Policy',
                function: returnpolicy,
                textcolor: Colors.black,
                decoration: TextDecoration.underline,
              ),
              const SizedBox(width: 20),
              AppTextButton1(
                label: 'Same day delivery',
                function: samedaydelivery,
                textcolor: Colors.black,
                decoration: TextDecoration.underline,
              )
            ],
          )
        ],
      ),
    );
  }
}

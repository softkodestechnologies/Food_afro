import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/product_display_card.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.productitem});
  final ProductDisplayCard productitem;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      // width: desktop ? media.width * .6 : media.width,
      child: Row(
        children: [
          SizedBox(
              width: (media.width * .3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: widescreen ? 130 : 80,
                    width: widescreen ? 180 : 115,
                    child: Image.asset(productitem.image),
                  ),
                ],
              )),
          SizedBox(
            width: (media.width * .08) + 15,
            child: BodyText(text: '£ ${productitem.price}'),
          ),
          SizedBox(
            width: (media.width * .07) + 40,
            child: const BodyText(text: 'Quantity'),
          ),
          SizedBox(
            width: (media.width * .06) + 55,
            child: const BodyText(text: 'Total Price'),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class CartTableBar extends StatelessWidget {
  const CartTableBar({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    return Container(
      height: 30,
      width: desktop ? media.width * .6 : media.width * .9,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: (media.width * .3),
          child: const BodyText(text: 'Product'),
        ),
        SizedBox(
          width: desktop ? (media.width * .1) : (media.width * .2),
          child: const BodyText(text: 'Price'),
        ),
        SizedBox(
          width: desktop ? (media.width * .1) : (media.width * .2),
          child: const BodyText(text: 'Quantity'),
        ),
        SizedBox(
          width: desktop ? (media.width * .1) : (media.width * .2),
          child: const BodyText(text: 'Total Price'),
        ),
      ]),
    );
  }
}

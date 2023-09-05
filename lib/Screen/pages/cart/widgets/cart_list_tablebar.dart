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
      // width: desktop ? media.width * .6 : media.width,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          color: Colors.red,
          width: (media.width * .3),
          child: const BodyText(text: 'Product'),
        ),
        Container(
          color: Colors.amber,
          width: (media.width * .08) + 50,
          child: const BodyText(text: 'Price'),
        ),
        Container(
          color: Colors.green,
          width: (media.width * .07) + 37,
          child: const BodyText(text: 'Quantity'),
        ),
        Container(
          color: Colors.blue,
          width: (media.width * .05) + 75,
          child: const BodyText(text: 'Total Price'),
        ),
      ]),
    );
  }
}

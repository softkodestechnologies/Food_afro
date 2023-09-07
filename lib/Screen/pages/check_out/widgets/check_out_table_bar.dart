import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class CheckoutTableBar extends StatelessWidget {
  const CheckoutTableBar({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    return Container(
      height: 30,
      width: desktop ? media.width * .3 : media.width * .9,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          width: desktop ? (media.width * .2) : (media.width * .5),
          child: const BodyText(text: 'Product'),
        ),
        Container(
          alignment: Alignment.center,
          width: desktop ? (media.width * .05) : (media.width * .2),
          child: const BodyText(text: 'QTY'),
        ),
        Container(
          alignment: Alignment.center,
          width: desktop ? (media.width * .05) : (media.width * .2),
          child: const BodyText(text: 'Price'),
        ),
      ]),
    );
  }
}

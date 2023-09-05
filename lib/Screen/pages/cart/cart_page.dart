import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/cart/sections/cart_summary.dart';
import 'package:food_afro_bean/Screen/pages/cart/sections/your_cart.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    bool desktop = ResponsiveScreenView.isDesktop(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widescreen ? media.width * 0.05 : 10),
      margin: const EdgeInsets.only(top: 10),
      height: desktop ? media.height * .75 : null,
      child: desktop
          ? const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YourCartSection(),
                Spacer(),
                CartSummary(),
              ],
            )
          : const YourCartSection(),
    );
  }
}

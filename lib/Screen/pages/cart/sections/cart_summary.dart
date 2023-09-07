import 'package:flutter/material.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:provider/provider.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var provider = Provider.of<ProductListProvider>(context, listen: true);
    bool desktop = ResponsiveScreenView.isDesktop(context);
    return Container(
      padding: const EdgeInsets.all(15),
      height: 170,
      width: desktop ? media.width * .25 : media.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TitleText(text: 'Cart Summary'),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyText(text: 'Sub Total'),
                BodyMediumText(text: '£ ${provider.totalamountInCart()}')
              ],
            ),
            const SizedBox(height: 30),
            AppButton1(
              label: 'Checkout(£ ${provider.totalamountInCart()})',
              function: () {
                provider.checkout();
              },
              width: desktop ? media.width * .25 : media.width,
            )
          ]),
    );
  }
}

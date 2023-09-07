import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/check_out/widgets/check_out_table_bar.dart';
import 'package:food_afro_bean/Screen/pages/check_out/widgets/check_out_table_item.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:provider/provider.dart';

class CheckOutProductDetails extends StatelessWidget {
  const CheckOutProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    var provider = Provider.of<ProductListProvider>(context);
    return SizedBox(
      width: desktop ? media.width * .3 : media.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CheckoutTableBar(),
          Column(
            children: provider.usercart
                .map((e) => CheckoutTableBarItem(itemModel: e))
                .toList(),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: desktop ? media.width * .6 : media.width * .9,
            child: const Divider(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: desktop ? media.width * .6 : media.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyMediumText(
                    text: 'Subtotal (${provider.usercart.length} items)',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                BodyMediumText(text: '£${provider.totalamountInCart()}'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: desktop ? media.width * .6 : media.width * .9,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BodyMediumText(
                    text: 'Shipping cost',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
                BodyMediumText(text: '£4.5'),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: desktop ? media.width * .6 : media.width * .9,
            child: const Divider(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: desktop ? media.width * .6 : media.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BodyMediumText(
                    text: 'Total cost',
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
                BodyMediumText(text: '£${provider.totalamountInCart() + 4.5}'),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

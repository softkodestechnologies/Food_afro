import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/cart/widgets/cart_item.dart';
import 'package:food_afro_bean/Screen/pages/cart/widgets/cart_list_tablebar.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/home_page_view.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

class YourCartSection extends StatelessWidget {
  const YourCartSection({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductListProvider>(context);
    var media = MediaQuery.of(context).size;

    bool desktop = ResponsiveScreenView.isDesktop(context);

    return SizedBox(
      // height: desktop ? null : media.height * 8,
      width: desktop ? media.width * .6 : media.width,
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const HeaderBoldText(
                text: 'Your Cart',
              ),
              AppTextButton1(
                  label: 'Continue Shopping',
                  textcolor: Colors.black,
                  decoration: TextDecoration.underline,
                  function: () {
                    Navigator.pushNamed(context, HomePageView.routeName);
                  }),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CartTableBar(),
                    Column(
                        children: provider.usercart
                            .map((e) => CartItem(productitem: e))
                            .toList()),
                    AppTextButton1(
                        label: 'Continue Shopping',
                        textcolor: Colors.black,
                        decoration: TextDecoration.underline,
                        function: () {
                          Navigator.pushNamed(context, HomePageView.routeName);
                        }),
                  ]),
            ),
          )
        ]),
      ),
    );
  }
}

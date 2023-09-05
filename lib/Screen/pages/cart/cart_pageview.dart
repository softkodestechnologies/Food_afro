import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/cart/cart_page.dart';
import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';

import 'sections/cart_summary.dart';

class CartPageView extends StatelessWidget {
  static const routeName = '/cart';
  const CartPageView({super.key});

  @override
  Widget build(BuildContext context) {
    bool desktop = ResponsiveScreenView.isDesktop(context);

    return Scaffold(
      body: const Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 130),
              CartPage(),
            ],
          )),
          ScreenHeader(),
        ],
      ),
      bottomNavigationBar: !desktop ? const CartSummary() : const SizedBox(),
    );
  }
}

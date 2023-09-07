import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/check_out/check_out_page.dart';
import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header.dart';

class CheckoutPageView extends StatelessWidget {
  static const routeName = '/check_out';
  const CheckoutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    // bool desktop = ResponsiveScreenView.isDesktop(context);

    return const Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 130),
              CheckOutPage(),
            ],
          )),
          ScreenHeader(),
        ],
      ),
      // bottomNavigationBar: !desktop ? const CartSummary() : const SizedBox(),
    );
  }
}

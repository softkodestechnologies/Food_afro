import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/check_out/sections/check_out_feilds.dart';
import 'package:food_afro_bean/Screen/pages/check_out/sections/check_out_product_details.dart';
// import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
// import 'package:provider/provider.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    // var productlistprovider = Provider.of<ProductListProvider>(context);

    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    bool desktop = ResponsiveScreenView.isDesktop(context);
    // bool tablet = ResponsiveScreenView.isTablet(context);

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widescreen ? media.width * 0.05 : 10),
      margin: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            desktop
                ? const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CheckoutFields(),
                      CheckOutProductDetails(),
                    ],
                  )
                : const Column(
                    children: [
                      CheckoutFields(),
                      SizedBox(height: 10),
                      CheckOutProductDetails()
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

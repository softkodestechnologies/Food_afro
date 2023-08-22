import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/product_item/section/product_item_details.dart';
import 'package:food_afro_bean/Screen/pages/product_item/widgets/product_carosel.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:provider/provider.dart';

class ProductItemScreen extends StatelessWidget {
  const ProductItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductListProvider>(context);
    final id = ModalRoute.of(context)?.settings.arguments as String;

    final data = provider.itemMatch(id);
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widescreen ? media.width * 0.05 : 10),
      margin: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ProductItemCarosel(
              images: data.images ?? [],
            ),
            ProductItemDetailsCard(
                title: data.title,
                description: data.details ?? '',
                price: data.price.toString(),
                noOfreviews: data.noOfReviews ?? ['2', '2', '3'],
                keyfeatures: data.keyFeatures,
                buynow: () {},
                addtocart: () {},
                discount: data.discount ?? false)
          ],
        ),
      ),
    );
  }
}

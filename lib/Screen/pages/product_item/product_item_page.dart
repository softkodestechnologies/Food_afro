import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/product_item/section/product_item_details.dart';
import 'package:food_afro_bean/Screen/pages/product_item/widgets/buttons_row.dart';
import 'package:food_afro_bean/Screen/pages/product_item/widgets/product_carosel.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_body_section.dart';
import 'package:food_afro_bean/widgets/app_pagenated_grid.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

class ProductItemScreen extends StatelessWidget {
  const ProductItemScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductListProvider>(context);
    final id = ModalRoute.of(context)?.settings.arguments as String;
    bool desktop = (ResponsiveScreenView.isDesktop(context));
    bool tablet = (ResponsiveScreenView.isTablet(context));
    // bool mobile = (ResponsiveScreenView.isMobile(context));
    final data = provider.itemMatch(id);
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widescreen ? media.width * 0.05 : 10),
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              width: desktop
                  ? media.width * .1
                  : tablet
                      ? media.width * .05
                      : 10,
            ),
            AppTextButton1(
              label: 'Home',
              textcolor: AppColors.textgray,
              function: () {},
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
            ),
            AppTextButton1(
              label: 'Products',
              textcolor: AppColors.textgray,
              function: () {},
            ),
            const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.black,
            ),
            AppTextButton1(
              label: data.title,
              textcolor: AppColors.textgray,
              function: () {},
            ),
          ]),
          const SizedBox(height: 20),
          widescreen
              ? Row(
                  mainAxisAlignment: tablet
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductItemCarosel(
                      images: data.images ?? [],
                    ),
                    if (desktop) const SizedBox(width: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductItemButtonRow(
                            send: () {}, link: () {}, fav: () {}),
                        ProductItemDetailsCard(
                            title: data.title,
                            description: data.details ?? data.description,
                            price: data.price.toString(),
                            noOfreviews: data.noOfReviews ?? ['2', '2', '3'],
                            keyfeatures: const [
                              'Lorem ipsum dolor sit amet consectetur.',
                              'Lorem ipsum dolor sit amet consectetur.',
                              'Lorem ipsum dolor sit amet consectetur.',
                              'Lorem ipsum dolor sit amet consectetur.',
                              'Lorem ipsum dolor sit amet consectetur.',
                              'Lorem ipsum dolor sit amet consectetur.',
                              'Lorem ipsum dolor sit amet consectetur.',
                              'Lorem ipsum dolor sit amet consectetur.',
                            ], //data.keyFeatures,
                            buynow: () {},
                            addtocart: () {},
                            returnpolicy: () {},
                            samedaydelivery: () {},
                            discountedPrice:
                                data.discountedPrice.toString() ?? '',
                            discount: data.discount ?? false),
                      ],
                    )
                  ],
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ProductItemButtonRow(
                          send: () {}, link: () {}, fav: () {}),
                      ProductItemCarosel(
                        images: data.images ?? [],
                      ),
                      ProductItemDetailsCard(
                          title: data.title,
                          description: data.details ?? data.description,
                          price: data.price.toString(),
                          noOfreviews: data.noOfReviews ?? ['2', '2', '3'],
                          keyfeatures: const [
                            'Lorem ipsum dolor sit amet consectetur.',
                            'Lorem ipsum dolor sit amet consectetur.',
                            'Lorem ipsum dolor sit amet consectetur.',
                            'Lorem ipsum dolor sit amet consectetur.',
                            'Lorem ipsum dolor sit amet consectetur.',
                            'Lorem ipsum dolor sit amet consectetur.',
                            'Lorem ipsum dolor sit amet consectetur.',
                            'Lorem ipsum dolor sit amet consectetur.',
                          ], //data.keyFeatures,
                          buynow: () {},
                          addtocart: () {},
                          returnpolicy: () {},
                          samedaydelivery: () {},
                          discountedPrice:
                              data.discountedPrice.toString() ?? '',
                          discount: data.discount ?? false),
                    ],
                  ),
                ),

          /////////////////////////
          AppBodySpliteSection(
              title: 'Recent search',
              description: null,
              function: () {},
              productList: provider.usercart),

          HeaderBoldText(
            text: 'Similar products',
            size: widescreen ? null : 16,
          ),
          AppPagenatedGrid(
              productList: provider.allproducts,
              numofColumns: desktop
                  ? 4
                  : tablet
                      ? 3
                      : 2),
        ],
      ),
    );
  }
}

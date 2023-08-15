import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/product_display_card.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_product_display_card.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

class AppBodySpliteSection extends StatelessWidget {
  const AppBodySpliteSection({
    super.key,
    required this.title,
    required this.description,
    this.buttontext,
    required this.function,
    required this.productList,
  });

  final String title;
  final String description;
  final String? buttontext;
  final VoidCallback function;
  final List<ProductDisplayCard> productList;
  ////

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    var provider = Provider.of<ProductListProvider>(context);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: media.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderBoldText(
                text: title,
                size: widescreen ? null : 16,
              ),
              AppTextButton1(
                  label: 'View all', function: function, textsize: 13),
            ],
          ),
          const SizedBox(height: 15),
          BodyText(text: description, maxLines: 2),
          const SizedBox(height: 15),

          SizedBox(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return AppProductDisplayCard(
                  id: productList[index].id,
                  image: productList[index].image,
                  title: productList[index].title,
                  description: productList[index].description,
                  price: productList[index].price,
                  stars: productList[index].stars,
                  addToCart: () {
                    provider.addtocart(productList[index].id);
                  },
                  isfavourite: () {
                    provider.isfavourite(productList[index].id);
                  },
                );
              },
            ),
          )
          // Align(
          //   alignment: Alignment.center,
          //   child: Wrap(
          //     spacing: 20, runSpacing: 20,
          //     // crossAxisAlignment: WrapCrossAlignment.start,
          //     // alignment: WrapAlignment.spaceBetween,
          //     children: productList
          //         .map(
          //           (e) => AppProductDisplayCard(
          //               image: e.image,
          //               title: e.title,
          //               description: e.description,
          //               price: e.price,
          //               stars: e.stars,
          //               addToCart: () {}),
          //         )
          //         .toList(),
          //   ),
          // )
        ],
      ),
    );
  }
}

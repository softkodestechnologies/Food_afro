import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/cart_item.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key, required this.productitem});
  final CartItemModel productitem;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductListProvider>(context);
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black),
        ),
      ),
      width: desktop ? media.width * .6 : media.width * .9,
      child: Row(
        children: [
          SizedBox(
              width: (media.width * .3),
              child: desktop
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: widescreen ? 130 : 80,
                          width: widescreen ? 180 : 115,
                          child: Image.asset(widget.productitem.image),
                        ),
                        SizedBox(
                          height: 130,
                          width: (media.width * .3) - (widescreen ? 180 : 115),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                  text: widget.productitem.title, size: 16),
                              const SizedBox(height: 9),
                              BodyText(
                                text: widget.productitem.description,
                                maxLines: 2,
                                size: 11,
                              ),
                              const Spacer(),
                              AppTextButton1(
                                label: 'Remove',
                                textcolor: Colors.black,
                                function: () {
                                  provider
                                      .removefromcart(widget.productitem.id);
                                },
                                decoration: TextDecoration.underline,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: widescreen ? 130 : 80,
                          width: widescreen ? 180 : 115,
                          child: Image.asset(widget.productitem.image,
                              fit: BoxFit.fill),
                        ),
                        SizedBox(
                          width: (media.width * .3),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TitleText(
                                  text: widget.productitem.title,
                                  size: 16,
                                  maxLines: 2),
                              const SizedBox(height: 9),
                              BodyText(
                                text: widget.productitem.description,
                                maxLines: 2,
                                size: 11,
                              ),
                              const SizedBox(height: 9),
                              AppTextButton1(
                                label: 'Remove',
                                textcolor: Colors.black,
                                function: () {
                                  provider
                                      .removefromcart(widget.productitem.id);
                                },
                                decoration: TextDecoration.underline,
                              ),
                              // const SizedBox(
                              //   height: 15,
                              // )
                            ],
                          ),
                        )
                      ],
                    )),
          SizedBox(
            width: desktop ? (media.width * .1) : (media.width * .2),
            // width: (media.width * .08) + 50,
            child: BodyText(text: '£ ${widget.productitem.price}'),
          ),
          SizedBox(
            width: desktop ? (media.width * .1) : (media.width * .2),
            // width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppImageIconButton(
                    image: 'assets/images/subtract.svg',
                    size: 18,
                    function: () {
                      provider.decrementCartItem(widget.productitem.id);
                    }),
                BodyText(text: '${widget.productitem.quantity}'),
                AppImageIconButton(
                    image: 'assets/images/add.svg',
                    size: 18,
                    function: () {
                      provider.incrementCartItem(widget.productitem.id);
                    }),
              ],
            ),
          ),
          SizedBox(
            width: desktop ? (media.width * .1) : (media.width * .2),
            // width: (media.width * .05) + 75,
            child: BodyText(
                text:
                    '£ ${widget.productitem.quantity * widget.productitem.price}'),
          ),
        ],
      ),
    );
  }
}

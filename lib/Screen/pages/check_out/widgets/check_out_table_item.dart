import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/cart_item.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class CheckoutTableBarItem extends StatelessWidget {
  const CheckoutTableBarItem({super.key, required this.itemModel});
  final CartItemModel itemModel;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool mobile = ResponsiveScreenView.isMobile(context);
    // bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
    //     ResponsiveScreenView.isTablet(context));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: desktop ? media.width * .3 : media.width * .9,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black54,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: desktop ? (media.width * .2) : (media.width * .5),
              child: SizedBox(
                child: Row(children: [
                  SizedBox(
                    height: 110,
                    width: mobile ? 70 : 100,
                    child: Image.asset(itemModel.image, fit: BoxFit.fill),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    height: 110,
                    width: desktop
                        ? (media.width * .2) - 120
                        : mobile
                            ? (media.width * .5) - 90
                            : (media.width * .5) - 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TitleText(text: itemModel.title, size: 16, maxLines: 2),
                        BodyText(
                          text: itemModel.description,
                          maxLines: 2,
                          size: 11,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10)
                ]),
              )),
          Container(
            alignment: Alignment.center,
            width: desktop ? (media.width * .05) : (media.width * .2),
            child: BodyText(text: '${itemModel.quantity}'),
          ),
          Container(
            alignment: Alignment.center,
            width: desktop ? (media.width * .05) : (media.width * .2),
            child: BodyText(text: '£ ${itemModel.price}'),
          ),
        ],
      ),
    );
  }
}

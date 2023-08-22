import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';

class ProductItemButtonRow extends StatelessWidget {
  const ProductItemButtonRow({
    super.key,
    required this.send,
    required this.link,
    required this.fav,
    this.width,
  });
  final double? width;
  final VoidCallback send;
  final VoidCallback link;
  final VoidCallback fav;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      width: widescreen ? width ?? 300 : media.width * .9,
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            child: Row(children: [
              AppImageIconButton(
                  image: 'assets/images/send.svg', function: send, size: 45),
              const SizedBox(width: 30),
              AppImageIconButton(
                  image: 'assets/images/link.svg', function: link, size: 45),
            ]),
          ),
          const Spacer(),
          AppImageIconButton(
              image: 'assets/images/like.svg', function: fav, size: 45),
        ],
      ),
    );
  }
}

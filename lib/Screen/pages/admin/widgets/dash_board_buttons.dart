import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AdminDashBoardButton extends StatelessWidget {
  const AdminDashBoardButton(
      {super.key,
      required this.image,
      required this.lable,
      required this.function,
      required this.selected});

  final String image;
  final String lable;
  final VoidCallback function;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: selected ? 1.0 : 0.7,
      child: Container(
        height: 50,
        width: 200,
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: selected
            ? const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                    AppColors.themeColor,
                    AppColors.themeColor2,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              )
            : null,
        child: InkWell(
          onTap: function,
          splashColor: AppColors.themeColor,
          child: Row(
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: SvgPicture.asset(image),
              ),
              const SizedBox(width: 7),
              TitleText(text: lable)
            ],
          ),
        ),
      ),
    );
  }
}

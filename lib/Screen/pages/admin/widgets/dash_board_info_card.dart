import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class DashBoardInfoCard extends StatelessWidget {
  const DashBoardInfoCard(
      {super.key,
      required this.image,
      required this.title,
      required this.value,
      required this.percentage,
      required this.profit,
      required this.rate});

  final String image;
  final String title;
  final String value;
  final double percentage;
  final bool profit;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: 180,
      margin: const EdgeInsets.only(right: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(child: SvgPicture.asset(image)),
          const SizedBox(height: 8),
          TitleText(
            text: title,
            fontWeight: FontWeight.w400,
            color: AppColors.textgray,
          ),
          const SizedBox(height: 8),
          BodyMediumText(
            text: value,
            color: Colors.black,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(profit
                  ? 'assets/images/arrowU.svg'
                  : 'assets/images/arrowD.svg'),
              const SizedBox(width: 3),
              SmallBodyText(
                text: '$percentage%',
                color: profit ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              SmallBodyText(
                text: rate,
                color: AppColors.textgray,
              )
            ],
          )
        ],
      ),
    );
  }
}

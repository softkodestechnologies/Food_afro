import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AppProfileAndText extends StatelessWidget {
  const AppProfileAndText(
      {super.key, required this.name, required this.image, this.radius});

  final String name;
  final String image;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Row(
        children: [
          CircleAvatar(
            maxRadius: radius ?? 14,
            backgroundImage: AssetImage(image),
          ),
          const SizedBox(width: 7),
          Expanded(
            // width: 90,
            child: BodyMediumText(
              text: 'Hello $name',
              fontWeight: FontWeight.w500,
              size: 14,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}

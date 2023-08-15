import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageIconButton extends StatelessWidget {
  const AppImageIconButton(
      {super.key, required this.image, this.size, required this.function});
  final String image;
  final double? size;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: SvgPicture.asset(
        image,
        height: size ?? 20,
        width: size ?? 20,
      ),
      // child: Image.asset(
      //   image,
      //   // fit: BoxFit.cover,
      // height: size ?? 17,
      // width: size ?? 17,
      // ),
    );
  }
}

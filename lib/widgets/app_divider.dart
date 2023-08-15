import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 0.5,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors:  [
            Colors.black12,
            Colors.black87,
            Colors.black,
            Colors.black87,
            Colors.black12,
          ],
        ),
        borderRadius: BorderRadius.circular(10),
        color: Colors.black87,
      ),
    );
  }
}

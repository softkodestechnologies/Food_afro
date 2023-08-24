import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class AdminWelcomeBar1 extends StatelessWidget {
  const AdminWelcomeBar1(
      {super.key, required this.title, required this.detail});

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool tablet = ResponsiveScreenView.isTablet(context);
    return SizedBox(
      width: desktop
          ? media.width * .4
          : tablet
              ? 500
              : 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderBoldText(
            text: title,
            size: desktop ? null : 17,
          ),
          const SizedBox(height: 8),
          BodyText(
            text: detail,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

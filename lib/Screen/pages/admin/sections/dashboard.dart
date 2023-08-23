import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_welcome_bar1.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';

class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    bool desktop = ResponsiveScreenView.isDesktop(context);

    return Container(
      width: media.width - 250,
      height: media.height,
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AdminWelcomeBar1(
                    title: 'Welcome, Jane Doe',
                    detail:
                        'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),


              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_dropdown.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';

class AdminTable extends StatelessWidget {
  const AdminTable(
      {super.key,
      required this.title,
      required this.appbar,
      required this.list});

  final String title;
  final Widget appbar;
  final List<Widget>? list;

  @override
  Widget build(BuildContext context) {
    bool desktop = ResponsiveScreenView.isDesktop(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        width: 900,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderBoldText(
              text: title,
              size: desktop ? null : 17,
            ),
            const SizedBox(height: 15),
            appbar,
            Container(
              height: 400,
              width: 900,
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: list ?? [],
              ),
            ),
            Row(
              /////////////   make api call for table
              children: [
                SmallBodyText(text: 'Last update 3:50pm PST'),
                const SizedBox(
                  width: 5,
                ),
                AppTextButton1(
                  label: 'Refresh',
                  function: () {},
                  decoration: TextDecoration.underline,
                ),
                const Spacer(),
                SizedBox(
                  child: Row(children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_left)),
                    Container(
                      alignment: Alignment.center,
                      width: 70,
                      child: SmallBodyText(text: '1 of 24'),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.keyboard_arrow_right)),
                  ]),
                ),
                const Spacer(),
                AdminDropDown(
                  value: '5',
                  listItems: ['5', '10'],
                  function: (p0) {},
                  title: 'Rows per page: ',
                  titlecolor: Colors.black,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

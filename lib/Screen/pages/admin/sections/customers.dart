import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_dropdown.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_welcome_bar1.dart';
import 'package:food_afro_bean/provider/dropdown_provider.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:provider/provider.dart';

class AdminCustomersPage extends StatefulWidget {
  const AdminCustomersPage({super.key});

  @override
  State<AdminCustomersPage> createState() => _AdminCustomersPageState();
}

class _AdminCustomersPageState extends State<AdminCustomersPage> {
  @override
  Widget build(BuildContext context) {
    var dropdownprovider = Provider.of<DropDownProvider>(context);
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    return Container(
      color: AppColors.backgroundGray,
      width: desktop ? media.width - 250 : media.width,
      height: media.height,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 35,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            media.width <= 370
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const AdminWelcomeBar1(
                          title: 'Customers',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      const SizedBox(height: 15),
                      AdminDropDown(
                        value: dropdownprovider.admincustormerDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadmincustormerDD(v);
                        },
                      )
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AdminWelcomeBar1(
                          title: 'Customers',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      AdminDropDown(
                        value: dropdownprovider.admincustormerDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadmincustormerDD(v);
                        },
                      )
                    ],
                  ),
            const SizedBox(height: 35),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: []),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_dropdown.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_tables.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_welcome_bar1.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/dash_board_info_card.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/tables/dashborads/dasboard_table_item.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/tables/dashborads/dashboard_table_bar.dart';
import 'package:food_afro_bean/provider/dropdown_provider.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:provider/provider.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  bool selectall = false;

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
                          title: 'Welcome, Jane Doe',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      const SizedBox(height: 15),
                      AdminDropDown(
                        value: dropdownprovider.admidashboardDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadmidashboardDD(v);
                        },
                      )
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AdminWelcomeBar1(
                          title: 'Welcome, Jane Doe',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      AdminDropDown(
                        value: dropdownprovider.admidashboardDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadmidashboardDD(v);
                        },
                      )
                    ],
                  ),
            const SizedBox(height: 35),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                DashBoardInfoCard(
                    image: 'assets/images/dollar.svg',
                    title: 'Total Sales',
                    value: '£ 100,000',
                    percentage: 2.3,
                    profit: true,
                    rate: '+£2k today'),
                DashBoardInfoCard(
                    image: 'assets/images/lista.svg',
                    title: 'Total Orders',
                    value: '32,403',
                    percentage: 7.6,
                    profit: true,
                    rate: '+2k today'),
                DashBoardInfoCard(
                    image: 'assets/images/contact1.svg',
                    title: 'New Customers',
                    value: '400',
                    percentage: 4.2,
                    profit: false,
                    rate: '+2k today'),
                DashBoardInfoCard(
                    image: 'assets/images/contact1.svg',
                    title: 'Total Customers',
                    value: '40,000',
                    percentage: 2,
                    profit: false,
                    rate: '+1k today'),
                DashBoardInfoCard(
                    image: 'assets/images/box2.svg',
                    title: 'Total Products',
                    value: '12,000',
                    percentage: 7.4,
                    profit: true,
                    rate: '+500 Jul'),
              ]),
            ),
            AdminTable(
              title: 'New Orders',
              appbar: DashboradTableBar(
                values: selectall,
                onchange: (p0) {
                  setState(() {
                    selectall = p0!;
                  });
                },
              ),
              list: [
                DashboardTableItem(
                  onchange: (p0) {},
                  values: false,
                  productId: 'sjkanjknmdcxkjn',
                  orderDate: '12/21/22',
                  productDetails: 'dqwweddsadxcwxaswxmmjkkkkkjkkwexws',
                  price: 12.2,
                  quantity: 4,
                  function: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

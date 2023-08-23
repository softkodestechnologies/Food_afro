import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/Screen/pages/admin/sections/customers.dart';
import 'package:food_afro_bean/Screen/pages/admin/sections/dashboard.dart';
import 'package:food_afro_bean/Screen/pages/admin/sections/orders.dart';
import 'package:food_afro_bean/Screen/pages/admin/sections/products.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/dash_board_buttons.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_profileIandT.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});
  static const routeName = '/Admin_Screen';

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final Widget dashboard = const AdminDashboardPage();
  final Widget products = const AdminProductPage();
  final Widget customers = const AdminCustomersPage();
  final Widget orders = const AdminOrdersPage();
  int pageselected = 1;

  void selectpage(int page) {
    pageselected = page;
  }

  @override
  Widget build(BuildContext context) {
    Widget page = dashboard;
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    Widget drawer = Container(
      height: media.height,
      width: 250,
      padding: const EdgeInsets.only(top: 50, left: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset('assets/images/logo3.svg'),
          const SizedBox(height: 80),
          AdminDashBoardButton(
            image: 'assets/images/home2.svg',
            lable: 'Dashboard',
            function: () {
              setState(() {
                selectpage(1);
                page = dashboard;
              });
            },
            selected: pageselected == 1,
          ),
          AdminDashBoardButton(
            image: 'assets/images/box.svg',
            lable: 'Products',
            function: () {
              setState(() {
                selectpage(2);
                page = products;
              });
            },
            selected: pageselected == 2,
          ),
          AdminDashBoardButton(
            image: 'assets/images/profile22.svg',
            lable: 'Customers',
            function: () {
              setState(() {
                selectpage(3);
                page = customers;
              });
            },
            selected: pageselected == 3,
          ),
          AdminDashBoardButton(
            image: 'assets/images/receipt1.svg',
            lable: 'Orders',
            function: () {
              setState(() {
                selectpage(4);
                page = orders;
              });
            },
            selected: pageselected == 4,
          ),
          const SizedBox(height: 120),
          Container(
            width: 170,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.backgroundGray,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: const AppProfileAndText(
                name: 'James', image: 'assets/images/profile.png'),
          )
        ],
      ),
    );

    return Scaffold(
      drawer: desktop
          ? null
          : Drawer(
              backgroundColor: Colors.white,
              child: drawer,
            ),
      appBar: desktop
          ? null
          : AppBar(
              centerTitle: true,
              title: SvgPicture.asset('assets/images/logo3.svg'),
              iconTheme: const IconThemeData(color: AppColors.complementColor),
              automaticallyImplyLeading: true,
            ),
      body: SizedBox(
        height: media.height,
        width: media.width,
        child: desktop
            ? Row(
                children: [
                  drawer,
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal, child: page)
                ],
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: page),
      ),
    );
  }
}

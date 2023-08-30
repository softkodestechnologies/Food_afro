import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/admin/dialogs/admin_order_dialog.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_dropdown.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_tables.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_welcome_bar1.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/display_tag_info.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/tables/orders/order_table_bar.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/tables/orders/order_table_item.dart';
import 'package:food_afro_bean/provider/dropdown_provider.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:provider/provider.dart';

class AdminOrdersPage extends StatefulWidget {
  const AdminOrdersPage({super.key});

  @override
  State<AdminOrdersPage> createState() => _AdminOrdersPageState();
}

class _AdminOrdersPageState extends State<AdminOrdersPage> {
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
                          title: 'Order',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      const SizedBox(height: 15),
                      AdminDropDown(
                        value: dropdownprovider.adminorderDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadminorderDD(v);
                        },
                      )
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AdminWelcomeBar1(
                          title: 'Order',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      AdminDropDown(
                        value: dropdownprovider.adminorderDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadminorderDD(v);
                        },
                      )
                    ],
                  ),
            const SizedBox(height: 35),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                DisplayTagInfo(
                    image: 'assets/images/lista.svg',
                    value: '12,000',
                    title: 'Total Orders'),
                DisplayTagInfo(
                    image: 'assets/images/lista.svg',
                    value: '12,000',
                    title: 'New Orders'),
                DisplayTagInfo(
                    image: 'assets/images/lista.svg',
                    value: '4,000',
                    title: 'Cleared Orders'),
                DisplayTagInfo(
                    image: 'assets/images/lista.svg',
                    value: '4,000',
                    title: 'Pending Orders'),
              ]),
            ),
            AdminTable(
              title: 'New Orders',
              appbar: OrderTableBar(onchange: (p0) {}, values: false),
              list: [
                OrderTableItem(
                  onchange: (p0) {},
                  values: false,
                  productId: 'dscacda',
                  orderDate: '22/22/22',
                  productDetails: 'kbdjcsd',
                  price: 232.3,
                  quantity: 32,
                  function: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const Dialog(
                          child: AdminOrderDialog(),
                        );
                      },
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

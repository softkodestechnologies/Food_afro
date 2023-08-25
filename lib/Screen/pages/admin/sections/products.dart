import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_dropdown.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_tables.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_welcome_bar1.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/display_tag_info.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/tables/products/product_table_bar.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/tables/products/product_table_item.dart';
import 'package:food_afro_bean/provider/dropdown_provider.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:provider/provider.dart';

class AdminProductPage extends StatefulWidget {
  const AdminProductPage({super.key});

  @override
  State<AdminProductPage> createState() => _AdminProductPageState();
}

class _AdminProductPageState extends State<AdminProductPage> {
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
                          title: 'Products',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      const SizedBox(height: 15),
                      AdminDropDown(
                        value: dropdownprovider.adminproductDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadminproductDD(v);
                        },
                      )
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AdminWelcomeBar1(
                          title: 'Products',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      AdminDropDown(
                        value: dropdownprovider.adminproductDD,
                        color: Colors.black,
                        listItems: dropdownprovider.listofvaluesforadminDD,
                        function: (v) {
                          dropdownprovider.setadminproductDD(v);
                        },
                      )
                    ],
                  ),
            const SizedBox(height: 35),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 250,
                    alignment: Alignment.center,
                    height: 90,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.themeColor,
                        border: Border.all(color: AppColors.complementColor)),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        BodyMediumText(
                          text: '+ ',
                          size: 23,
                        ),
                        BodyMediumText(text: 'Add new product'),
                      ],
                    ),
                  ),
                ),
                const DisplayTagInfo(
                    hight: 90,
                    image: 'assets/images/lista.svg',
                    value: '12,000',
                    width: 270,
                    title: 'Total Products'),
                const DisplayTagInfo(
                    hight: 90,
                    image: 'assets/images/lista.svg',
                    value: '4,000',
                    width: 270,
                    title: 'Available Products'),
              ]),
            ),
            AdminTable(
              title: 'Products',
              appbar: ProductTableBar(onchange: (p0) {}, values: false),
              list: [
                ProductTableItem(
                  onchange: (p0) {},
                  values: false,
                  productId: 'sddcsdadcaececd',
                  productDetails: 'Water',
                  price: 23.3,
                  quantity: 33,
                  availableQuantity: 1010,
                  uploadDate: '20/2/22',
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

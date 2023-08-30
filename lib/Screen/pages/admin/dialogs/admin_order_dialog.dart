import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/product_pic_remove.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_titled_textfield.dart';

enum Status { ActiveOrder, Processed, ClosedOrder }

class AdminOrderDialog extends StatefulWidget {
  const AdminOrderDialog({super.key});

  @override
  State<AdminOrderDialog> createState() => _AdminOrderDialogState();
}

class _AdminOrderDialogState extends State<AdminOrderDialog> {
  late final TextEditingController customername;
  late final TextEditingController ordernumber;
  late final TextEditingController quantity;
  late final TextEditingController totalprice;
  late final TextEditingController dropoffaddress;

  int processvalue = 3; //  1 active,  2 processed, 3 closed order

  @override
  void initState() {
    customername = TextEditingController();
    ordernumber = TextEditingController();
    quantity = TextEditingController();
    totalprice = TextEditingController();
    dropoffaddress = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    customername.dispose();
    ordernumber.dispose();
    quantity.dispose();
    totalprice.dispose();
    dropoffaddress.dispose();
    super.dispose();
  }

  final List<String> images = [
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      color: Colors.white,
      height: media.height * .9,
      width: media.width * .8,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 25,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderBoldText(
                  text: 'Product',
                  size: desktop ? null : 17,
                ),
                const Spacer(),
                AppImageIconButton(
                  image: 'assets/images/close.svg',
                  function: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(width: 10)
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(vertical: 5),
              height: 35,
              width: 100,
              decoration: BoxDecoration(
                color: processvalue == 1
                    ? AppColors.themeColor
                    : processvalue == 2
                        ? Colors.green[50]
                        : Colors.red[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: BodyText(
                text: processvalue == 1
                    ? 'Active Order'
                    : processvalue == 2
                        ? 'Processed'
                        : 'Closed Order',
                color: processvalue == 1
                    ? AppColors.complementColor
                    : processvalue == 2
                        ? Colors.green
                        : Colors.red,
              ),
            ),

            ///
            SizedBox(
              width: 450,
              height: widescreen ? 300 : 200,
              child: GridView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ProductImageView(
                      showRemove: false,
                      imageUrl: images[index],
                      funtion: () {},
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3)),
            ),
            const SizedBox(height: 10),
            desktop
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 850,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTitledTextField(
                            title: 'Customer Name',
                            edit: true,
                            controller: customername,
                            width: 400,
                          ),
                          // SizedBox(width: ((media.width * .8) - 850.0)),
                          AppTitledTextField(
                            title: 'Order Number',
                            edit: true,
                            controller: ordernumber,
                            width: 400,
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(children: [
                    AppTitledTextField(
                      title: 'Customer Name',
                      edit: true,
                      controller: customername,
                    ),
                    // SizedBox(width: ((media.width * .8) - 850.0)),
                    AppTitledTextField(
                      title: 'Order Number',
                      edit: true,
                      controller: ordernumber,
                    ),
                  ]),
            const SizedBox(height: 20),
            desktop
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 850,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppTitledTextField(
                            title: 'Quantity',
                            edit: true,
                            controller: quantity,
                            width: 400,
                          ),

                          // SizedBox(width: ((media.width * .8) - 850.0)),
                          AppTitledTextField(
                            title: 'Total Price',
                            edit: true,
                            controller: totalprice,
                            width: 400,
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      AppTitledTextField(
                        title: 'Quantity',
                        edit: true,
                        controller: quantity,
                      ),

                      // SizedBox(width: ((media.width * .8) - 850.0)),
                      AppTitledTextField(
                        title: 'Total Price',
                        edit: true,
                        controller: totalprice,
                      ),
                    ],
                  ),
            const SizedBox(height: 20),
            AppTitledTextField(
              title: 'Drop off Address',
              edit: true,
              controller: dropoffaddress,
            ),
          ],
        ),
      ),
    );
  }
}

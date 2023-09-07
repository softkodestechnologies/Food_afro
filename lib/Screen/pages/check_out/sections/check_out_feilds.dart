import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/check_out/widgets/check_out_select_box.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_titled_textfield.dart';

class CheckoutFields extends StatefulWidget {
  const CheckoutFields({super.key});

  @override
  State<CheckoutFields> createState() => _CheckoutFieldsState();
}

class _CheckoutFieldsState extends State<CheckoutFields> {
  /// controllers
  late final TextEditingController _firstname;
  late final TextEditingController _lastname;
  late final TextEditingController _countryRegion;
  late final TextEditingController _city;
  late final TextEditingController _address;
  late final TextEditingController _phonenumber;
  late final TextEditingController _appartmentsuitnumber;
  late final TextEditingController _postcode;

  ///
  @override
  void initState() {
    // TODO: implement initState

    _firstname = TextEditingController();
    _lastname = TextEditingController();
    _countryRegion = TextEditingController();
    _city = TextEditingController();
    _address = TextEditingController();
    _phonenumber = TextEditingController();
    _appartmentsuitnumber = TextEditingController();
    _postcode = TextEditingController();
    super.initState();
  }

//
  @override
  void dispose() {
    // TODO: implement dispose
    _firstname.dispose();
    _lastname.dispose();
    _countryRegion.dispose();
    _city.dispose();
    _address.dispose();
    _phonenumber.dispose();
    _appartmentsuitnumber.dispose();
    _postcode.dispose();
    super.dispose();
  }

  ////////////widgets
  var homedelivery = CheckOutSelectBox(
    title: 'Home delivery',
    description: 'Home delivery explanation',
    selected: true,
    function: () {},
  );
  var pickup = CheckOutSelectBox(
    title: 'Pick up',
    description: 'pick up explanation',
    selected: false,
    function: () {},
  );
  var paypal = CheckOutSelectBox(
    title: 'Paypal',
    description: 'Pay using your paypal account',
    selected: false,
    function: () {},
  );
  var card = CheckOutSelectBox(
    title: 'Card',
    description: 'Pay with your card',
    selected: true,
    function: () {},
  );
  var banktransfer = CheckOutSelectBox(
    title: 'Bank Transfer',
    description: 'Pay using your Bank',
    selected: false,
    function: () {},
  );
  var googleapplepay = CheckOutSelectBox(
    title: 'Google/Apple pay',
    description: 'Pay with Google/Apple',
    selected: false,
    function: () {},
  );

  @override
  Widget build(BuildContext context) {
    /// onbuild
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool tablet = ResponsiveScreenView.isTablet(context);
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    double tbwidth = desktop
        ? media.width * .24
        : tablet
            ? media.width * .42
            : media.width * .9;

    /////////

    return SizedBox(
      width: desktop ? media.width * .5 : media.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(
            text: 'Delivery Methods',
            color: AppColors.textgray,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 10),
          widescreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [homedelivery, pickup],
                )
              : Column(
                  children: [homedelivery, const SizedBox(height: 10), pickup],
                ),
          const SizedBox(height: 10),
          const TitleText(
            text: 'Shipping Address',
            color: AppColors.textgray,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 10),
          widescreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitledTextField(
                      title: 'First name',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _firstname,
                    ),
                    AppTitledTextField(
                      title: 'Last name',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _lastname,
                    ),
                  ],
                )
              : Column(
                  children: [
                    AppTitledTextField(
                      title: 'First name',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _firstname,
                    ),
                    const SizedBox(height: 10),
                    AppTitledTextField(
                      title: 'Last name',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _lastname,
                    ),
                  ],
                ),
          const SizedBox(height: 10),

          //////////////////////////////////////////////////////////
          widescreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitledTextField(
                      title: 'Country/Region',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _countryRegion,
                    ),
                    AppTitledTextField(
                      title: 'City',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _city,
                    ),
                  ],
                )
              : Column(
                  children: [
                    AppTitledTextField(
                      title: 'Country/Region',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _countryRegion,
                    ),
                    const SizedBox(height: 10),
                    AppTitledTextField(
                      title: 'City',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _city,
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          ////////////////////////////////////////////////////////////
          widescreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitledTextField(
                      title: 'Address',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _address,
                    ),
                    AppTitledTextField(
                      title: 'Phone number',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _phonenumber,
                    ),
                  ],
                )
              : Column(
                  children: [
                    AppTitledTextField(
                      title: 'Address',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _address,
                    ),
                    const SizedBox(height: 10),
                    AppTitledTextField(
                      title: 'Phone number',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _phonenumber,
                    ),
                  ],
                ),
          const SizedBox(height: 10),

          ////////////////////////////////////////////////////////////
          widescreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppTitledTextField(
                      title: 'Apartment,suit or number',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _appartmentsuitnumber,
                    ),
                    AppTitledTextField(
                      title: 'Postcode',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _postcode,
                    ),
                  ],
                )
              : Column(
                  children: [
                    AppTitledTextField(
                      title: 'Apartment,suit or number',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _appartmentsuitnumber,
                    ),
                    const SizedBox(height: 10),
                    AppTitledTextField(
                      title: 'Postcode',
                      edit: true,
                      width: tbwidth,
                      height: 70,
                      controller: _postcode,
                    ),
                  ],
                ),
          const SizedBox(height: 10),
          const TitleText(
            text: 'Payment Method',
            color: AppColors.textgray,
            fontWeight: FontWeight.w400,
          ),
          const SizedBox(height: 10),
          widescreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [paypal, card],
                )
              : Column(
                  children: [paypal, const SizedBox(height: 10), card],
                ),
          const SizedBox(height: 10),
          widescreen
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [banktransfer, googleapplepay],
                )
              : Column(
                  children: [
                    banktransfer,
                    const SizedBox(height: 10),
                    googleapplepay
                  ],
                ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:food_afro_bean/Screen/pages/filter/widget/checkBox_text_text.dart';
// import 'package:food_afro_bean/util/app_color.dart';
// import 'package:food_afro_bean/util/responsive_screen.dart';
// import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
// import 'package:food_afro_bean/widgets/app_text.dart';

// class FilterScreen extends StatefulWidget {
//   static const routeName = '/filter_screen';

//   const FilterScreen(
//       {super.key,
//       this.width,
//       required this.vegetables,
//       required this.vegetablesonchange,
//       required this.vegetablescount,
//       required this.sweets,
//       required this.sweetsonchange,
//       required this.sweetscount,
//       required this.spices,
//       required this.spicesonchange,
//       required this.spicescount,
//       required this.snacksandDrinks,
//       required this.snacksandDrinksonchange,
//       required this.snacksandDrinkscount,
//       required this.cheapest,
//       required this.cheapestonchange,
//       required this.mostExpensive,
//       required this.mostExpensiveonchange,
//       required this.pricesMaxRange,
//       required this.minmumprice,
//       required this.maximumprice,
//       required this.rangeValues,
//       required this.pricerangeFunction,
//       required this.fivestars,
//       required this.fivestarsonchange,
//       required this.fourstars,
//       required this.fourstarsonchange,
//       required this.threestars,
//       required this.threestarsonchange});
//   final double? width;
// ///////////////////

//   //////////////////////
//   final bool vegetables;
//   final Function(bool?) vegetablesonchange;
//   final int vegetablescount;
//   final bool sweets;
//   final Function(bool?) sweetsonchange;
//   final int sweetscount;
//   final bool spices;
//   final Function(bool?) spicesonchange;
//   final int spicescount;
//   final bool snacksandDrinks;
//   final Function(bool?) snacksandDrinksonchange;
//   final int snacksandDrinkscount;
// ///////////////////
//   final bool cheapest;
//   final Function(bool?) cheapestonchange;
//   final bool mostExpensive;
//   final Function(bool?) mostExpensiveonchange;
// ////////////////////
//   final double pricesMaxRange;
//   final double minmumprice;
//   final double maximumprice;
//   final RangeValues rangeValues;
//   final Function(RangeValues) pricerangeFunction;
//   ////////////
//   final bool fivestars;
//   final Function(bool?) fivestarsonchange;
//   final bool fourstars;
//   final Function(bool?) fourstarsonchange;
//   final bool threestars;
//   final Function(bool?) threestarsonchange;
//   @override
//   State<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends State<FilterScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var media = MediaQuery.of(context).size;

//     bool mobile = (ResponsiveScreenView.isMobile(context));
//     return Scaffold(
//       body: Container(
//         width: mobile ? media.width * .9 : widget.width ?? 230,
//         height: 680,
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 children: [
//                   const HeaderBoldText(
//                     text: 'Filter',
//                     // size: 16,
//                   ),
//                   if (mobile) const Spacer(),
//                   if (mobile)
//                     AppImageIconButton(
//                       image: 'assets/images/close.svg',
//                       function: () => Navigator.pop(context),
//                     ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               const BodyText(
//                 text: 'Lorem ipsum dolor sit amet consectetur.',
//                 maxLines: 2,
//               ),
//               const SizedBox(height: 10),
//               const BodyMediumText(text: 'Category'),
//               FilterCheckBox1(
//                 label: 'Vegetable',
//                 count: 122,
//                 onchange: widget.vegetablesonchange,
//                 values: widget.vegetables,
//               ),
//               FilterCheckBox1(
//                 label: 'Sweets',
//                 count: 12,
//                 onchange: widget.sweetsonchange,
//                 values: widget.sweets,
//               ),
//               FilterCheckBox1(
//                 label: 'Spices',
//                 count: 12,
//                 onchange: widget.spicesonchange,
//                 values: widget.spices,
//               ),
//               FilterCheckBox1(
//                 label: 'Snacks & Drinks',
//                 count: 12,
//                 onchange: widget.snacksandDrinksonchange,
//                 values: widget.snacksandDrinks,
//               ),
//               const SizedBox(height: 10),
//               const BodyMediumText(text: 'Prices'),
//               FilterCheckBox2(
//                 label: 'Cheapest',
//                 onchange: widget.cheapestonchange,
//                 values: widget.cheapest,
//               ),
//               FilterCheckBox2(
//                 label: 'Most expensive',
//                 onchange: widget.mostExpensiveonchange,
//                 values: widget.mostExpensive,
//               ),
//               const SizedBox(height: 10),
//               const BodyMediumText(text: 'Prices Range'),
//               BodyText(
//                 text:
//                     'Prices: \$ ${widget.rangeValues.start.toStringAsFixed(2)} - \$ ${widget.rangeValues.end.toStringAsFixed(2)}',
//                 size: 13,
//               ),
//               SizedBox(
//                 width: 200,
//                 child: RangeSlider(
//                     values: widget.rangeValues,
//                     min: widget.minmumprice,
//                     max: widget.maximumprice,
//                     activeColor: AppColors.complementColor,
//                     onChanged: widget.pricerangeFunction),
//               ),
//               const SizedBox(height: 10),
//               const BodyMediumText(text: 'Ratings'),
//               FilterCheckBox3(
//                 stars: 5,
//                 onchange: widget.fivestarsonchange,
//                 values: widget.fivestars,
//               ),
//               FilterCheckBox3(
//                 stars: 4,
//                 onchange: widget.fourstarsonchange,
//                 values: widget.fourstars,
//               ),
//               FilterCheckBox3(
//                 stars: 3,
//                 onchange: widget.threestarsonchange,
//                 values: widget.threestars,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

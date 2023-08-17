import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/filter/filter.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';

class ProductPageScreen extends StatefulWidget {
  const ProductPageScreen({super.key});

  @override
  State<ProductPageScreen> createState() => _ProductPageScreenState();
}

class _ProductPageScreenState extends State<ProductPageScreen> {
  bool vegetables = false;
  bool sweets = false;
  bool spices = false;
  bool snacksandDrinks = false;
  bool cheapest = false;
  bool mostExpensive = false;
  bool fivestars = false;
  bool fourstars = false;
  bool threestars = false;
  RangeValues range = RangeValues(0, 1000);
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    double low = 0;
    double high = 1000;
    double miniR = range.start;///  end results
    double maxR = range.end;///  end results

    return Container(
      width: media.width,
      padding: EdgeInsets.symmetric(
          horizontal: widescreen ? media.width * 0.05 : 10),
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        FilterSection(
          vegetables: vegetables,
          vegetablesonchange: (p0) {
            setState(() {
              vegetables = p0!;
            });
          },
          vegetablescount: 120,
          sweets: sweets,
          sweetsonchange: (p0) {
            setState(() {
              sweets = p0!;
            });
          },
          sweetscount: 23,
          spices: spices,
          spicesonchange: (p0) {
            setState(() {
              spices = p0!;
            });
          },
          spicescount: 10,
          snacksandDrinks: snacksandDrinks,
          snacksandDrinksonchange: (p0) {
            setState(() {
              snacksandDrinks = p0!;
            });
          },
          snacksandDrinkscount: 2,
          cheapest: cheapest,
          cheapestonchange: (p0) {
            setState(() {
              cheapest = p0!;
            });
          },
          mostExpensive: mostExpensive,
          mostExpensiveonchange: (p0) {
            setState(() {
              mostExpensive = p0!;
            });
          },
          pricesMaxRange: high,
          minmumprice: low,
          maximumprice: high,
          rangeValues: range,
          pricerangeFunction: (p0) {
            setState(() {
              print('1');
              range = p0;
              print('2');
            });
          },
          fivestars: fivestars,
          fivestarsonchange: (p0) {
            setState(() {
              fivestars = p0!;
            });
          },
          fourstars: fourstars,
          fourstarsonchange: (p0) {
            setState(() {
              fourstars = p0!;
            });
          },
          threestars: threestars,
          threestarsonchange: (p0) {
            setState(() {
              threestars = p0!;
            });
          },
        )
      ]),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/filter/filter.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_pagenated_grid.dart';
import 'package:food_afro_bean/widgets/app_search_bar.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

import '../../../provider/product_lists_provider.dart';

class ViewAllProductPageScreen extends StatefulWidget {
  const ViewAllProductPageScreen({super.key});

  @override
  State<ViewAllProductPageScreen> createState() =>
      _ViewAllProductPageScreenState();
}

class _ViewAllProductPageScreenState extends State<ViewAllProductPageScreen> {
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
////
  ///
  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    var productlistprovider = Provider.of<ProductListProvider>(context);
    var media = MediaQuery.of(context).size;

    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    bool desktop = (ResponsiveScreenView.isDesktop(context));
    bool tablet = (ResponsiveScreenView.isTablet(context));
    bool mobile = (ResponsiveScreenView.isMobile(context));
    double low = 0;
    double high = 1000;
    // double miniR = range.start;///  end results
    // double maxR = range.end;///  end results

    void filterCLick() {
      setState(() {
        showFilter = !showFilter;
      });
    }
////////////

    final searchbar = AppSearchBar1(
      suggestions: ['Garri'],
      searchQuery: 'Garri',
      width: desktop
          ? 450
          : tablet
              ? media.width * .5
              : media.width * .9,
    );

    var filter = FilterSection(
      width: 200,
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
      function: filterCLick,
    );

    return Container(
      width: media.width,
      padding:
          EdgeInsets.symmetric(horizontal: widescreen ? media.width * .01 : 10),
      margin: const EdgeInsets.only(top: 10),
      child: showFilter
          ? filter
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    width: desktop
                        ? media.width * .1
                        : tablet
                            ? media.width * .05
                            : 10,
                  ),
                  AppTextButton1(
                    label: 'Home',
                    textcolor: AppColors.textgray,
                    function: () {},
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    color: Colors.black,
                  ),
                  AppTextButton1(
                    label: 'Products',
                    textcolor: AppColors.textgray,
                    function: () {},
                  ),
                ]),
                const SizedBox(height: 20),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      mobile
                          ? const SizedBox()
                          : SizedBox(
                              width: 280,
                              child: filter,
                            ),
                      if (!mobile) const SizedBox(width: 15),
                      SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mobile
                                ? SizedBox(
                                    width: media.width * .9,
                                    child: Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                HeaderBoldText(
                                                  text:
                                                      'Most requested products',
                                                  maxLines: 2,
                                                  size: mobile ? 20 : null,
                                                ),
                                                const Spacer(),
                                                AppImageIconButton(
                                                  image:
                                                      'assets/images/sort.svg',
                                                  function: filterCLick,
                                                ),
                                              ],
                                            ),
                                            const BodyText(
                                              text:
                                                  'Discover our top-requested products across Europe!',
                                              maxLines: 2,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        searchbar,
                                        const SizedBox(height: 10),
                                      ],
                                    ),
                                  )
                                : SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const HeaderBoldText(
                                          text: 'Most requested products',
                                          // size: 16,
                                        ),
                                        const BodyText(
                                          text:
                                              'Discover our top-requested products across Europe!',
                                          maxLines: 2,
                                        ),
                                        const SizedBox(height: 20),
                                        searchbar,
                                        const SizedBox(height: 20),
                                      ],
                                    ),
                                  ),
                            AppPagenatedGrid(
                                productList: productlistprovider.allproducts),
                          ],
                        ),
                      )
                    ]),
              ],
            ),
    );
  }
}

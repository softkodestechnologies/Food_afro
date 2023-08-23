import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/product_item/product_item_view.dart';
import 'package:food_afro_bean/model/product_display_card.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
// import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_ItemRowColumn.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_product_display_card.dart';
// import 'package:food_afro_bean/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

class AppPagenatedGrid extends StatefulWidget {
  const AppPagenatedGrid(
      {super.key,
      required this.productList,
      this.numofRows,
      this.numofColumns});

  final List<ProductDisplayCard> productList;
  final int? numofRows;
  final int? numofColumns;

  @override
  State<AppPagenatedGrid> createState() => _AppPagenatedGridState();
}

class _AppPagenatedGridState extends State<AppPagenatedGrid> {
// num of row should an optional parameter in the constructor, if not given use below
  int numofRow({required int numofColumn, required int listLenght}) {
    double rowIndexA = (listLenght / numofColumn);
    int rowIndexB = (listLenght / numofColumn).floor();
    if (rowIndexA != rowIndexB) {
      return (rowIndexB + 1);
    } else {
      return (rowIndexB);
    }
  }

  List<List<ProductDisplayCard>> subList = [];

  int currentpageNum = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductListProvider>(
      context,
    );
    // var media = MediaQuery.of(context).size;
    bool desktop = (ResponsiveScreenView.isDesktop(context));
    // bool tablet = (ResponsiveScreenView.isTablet(context));
    int numOfColumn = widget.numofColumns ?? (desktop ? 3 : 2);
    //
    int sublistSize = desktop ? 15 : 14;
    int pagestotal = (widget.productList.length / sublistSize).floor();
//

    for (int i = 0; i < widget.productList.length; i += sublistSize) {
      int endIndex = i + sublistSize;
      if (endIndex > widget.productList.length) {
        endIndex = widget.productList.length;
      }
      subList.add(widget.productList.sublist(i, endIndex));
    }

////////////////////////////// PAGE LOGIC ///

    // int numPagesPerView = 4;

    // List<int> pages = [];
    // for (int i = 1; i <= pagestotal; i++) {
    //   pages.add(i);
    //   // print(i);
    // }
    // List<List<int>> pageList = [];

    // for (int i = 0; i < pages.length; i += numPagesPerView) {
    //   int endIndex = i + numPagesPerView;
    //   if (endIndex > pages.length) {
    //     endIndex = pages.length;
    //   }
    //   pageList.add(pages.sublist(i, endIndex));
    // }

    // int pageIndex = 0;

    // String pag1 = (pageList[pageIndex][0] <= pageList[pageIndex].length)
    //     ? pageList[pageIndex][0].toString()
    //     : '';
    // String pag2 = (pageList[pageIndex][1] <= pageList[pageIndex].length)
    //     ? pageList[pageIndex][1].toString()
    //     : '';
    // String pag3 = (pageList[pageIndex][2] <= pageList[pageIndex].length)
    //     ? pageList[pageIndex][2].toString()
    //     : '';
    // String pag4 = (pageList[pageIndex][3] <= pageList[pageIndex].length)
    //     ? pageList[pageIndex][3].toString()
    //     : '';

    return SizedBox(
      child: Column(
        children: [
          AppGridWidget(
            rowNum: widget.numofRows ??
                numofRow(numofColumn: numOfColumn, listLenght: sublistSize),
            columnNum: numOfColumn,
            widgetList: subList[currentpageNum]
                .map(
                  (e) => AppProductDisplayCard(
                    onClick: () {
                      Navigator.pushNamed(
                          context, ProductItemPageView.routeName,
                          arguments: e.id);
                    },
                    id: e.id,
                    image: e.image,
                    title: e.title,
                    description: e.description,
                    price: e.price,
                    stars: e.stars,
                    fav: e.favourite,
                    addToCart: () {
                      provider.addtocart(e.id);
                    },
                    isfavourite: () {
                      provider.isfavourite(e.id);
                    },
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          SizedBox(
            child: Row(
              children: [
                AppImageIconButton(
                  size: 30,
                  image: 'assets/images/leftArrow.svg',
                  function: () {
                    setState(() {
                      // pageIndex -= 1;

                      if (currentpageNum != 0) {
                        currentpageNum -= 1;
                      }
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 100,
                  // child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       AppTextButton1(
                  //         label: pag1,
                  //         textsize: 15,
                  //         function: () {
                  //           setState(() {
                  //             currentpageNum = pageList[pageIndex][0];
                  //           });
                  //         },
                  //         textcolor: (currentpageNum) == pageList[pageIndex][0]
                  //             ? null
                  //             : AppColors.textgray,
                  //       ),
                  //       AppTextButton1(
                  //         label: pag2,
                  //         textsize: 15,
                  //         function: () {
                  //           setState(() {
                  //             currentpageNum = pageList[pageIndex][1];
                  //           });
                  //         },
                  //         textcolor: (currentpageNum) == pageList[pageIndex][1]
                  //             ? null
                  //             : AppColors.textgray,
                  //       ),
                  //       AppTextButton1(
                  //         label: pag3,
                  //         textsize: 15,
                  //         function: () {
                  //           setState(() {
                  //             currentpageNum = pageList[pageIndex][2];
                  //           });
                  //         },
                  //         textcolor: currentpageNum == pageList[pageIndex][2]
                  //             ? null
                  //             : AppColors.textgray,
                  //       ),
                  //       AppTextButton1(
                  //         label: pag4,
                  //         textsize: 15,
                  //         function: () {
                  //           setState(() {
                  //             if (pageList[pageIndex][3] <=
                  //                 pageList[pageIndex].length) {}
                  //             currentpageNum = pageList[pageIndex][3];
                  //           });
                  //         },
                  //         textcolor: currentpageNum == pageList[pageIndex][3]
                  //             ? null
                  //             : AppColors.textgray,
                  //       ),
                  //     ]),
                ),
                AppImageIconButton(
                  size: 30,
                  image: 'assets/images/rightArrow.svg',
                  function: () {
                    setState(() {
                      // pageIndex += 1;

                      if (currentpageNum != pagestotal) {
                        currentpageNum += 1;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

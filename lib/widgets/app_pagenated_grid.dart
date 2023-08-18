import 'package:flutter/material.dart';
import 'package:food_afro_bean/model/product_display_card.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_ItemRowColumn.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_product_display_card.dart';
import 'package:provider/provider.dart';

class AppPagenatedGrid extends StatefulWidget {
  AppPagenatedGrid({super.key, required this.productList, this.numofRows});

  final List<ProductDisplayCard> productList;
  final int? numofRows;

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
    var media = MediaQuery.of(context).size;
    bool desktop = (ResponsiveScreenView.isDesktop(context));
    bool tablet = (ResponsiveScreenView.isTablet(context));
    int numOfColumn = (desktop ? 3 : 2);
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

    return Container(
      child: Column(
        children: [
          AppGridWidget(
            rowNum: widget.numofRows ??
                numofRow(numofColumn: numOfColumn, listLenght: sublistSize),
            columnNum: numOfColumn,
            widgetList: subList[currentpageNum]
                .map(
                  (e) => AppProductDisplayCard(
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
                      if (currentpageNum != 0) {
                        currentpageNum -= 1;
                      }
                    });
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 17,
                  child: Row(children: []),
                ),
                AppImageIconButton(
                  size: 30,
                  image: 'assets/images/rightArrow.svg',
                  function: () {
                    setState(() {
                      if (currentpageNum != pagestotal) {
                        currentpageNum += 1;
                      }
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/widgets/home_soup_card.dart';
import 'package:food_afro_bean/model/home_soup_card_model.dart';
import 'package:food_afro_bean/model/product_display_card.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/provider/soup_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_ItemRowColumn.dart';
import 'package:food_afro_bean/widgets/app_product_display_card.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_button.dart';
import 'package:provider/provider.dart';

class AppBodySpliteSection extends StatelessWidget {
  const AppBodySpliteSection({
    super.key,
    required this.title,
    required this.description,
    this.buttontext,
    required this.function,
    required this.productList,
  });

  final String title;
  final String description;
  final String? buttontext;
  final VoidCallback function;
  final List<ProductDisplayCard> productList;
  ////
  int numofRow({required int numofColumn, required int listLenght}) {
    double rowIndexA = (listLenght / numofColumn);
    int rowIndexB = (listLenght / numofColumn).floor();
    if (rowIndexA != rowIndexB) {
      return (rowIndexB + 1);
    } else {
      return (rowIndexB);
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    bool desktop = (ResponsiveScreenView.isDesktop(context));
    bool tablet = (ResponsiveScreenView.isTablet(context));
    var provider = Provider.of<ProductListProvider>(
      context,
    );

    int numOfColumn = desktop
        ? 4
        : (tablet)
            ? 3
            : 2;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: media.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderBoldText(
                text: title,
                size: widescreen ? null : 16,
              ),
              AppTextButton1(
                  label: 'View all', function: function, textsize: 13),
            ],
          ),
          const SizedBox(height: 15),
          BodyText(text: description, maxLines: 2),
          const SizedBox(height: 15),
          AppGridWidget(
            rowNum: numofRow(
                numofColumn: numOfColumn, listLenght: productList.length),
            columnNum: numOfColumn,
            widgetList: productList
                .map((e) => AppProductDisplayCard(
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
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////////
class AppBodySpliteSectionSoup extends StatelessWidget {
  const AppBodySpliteSectionSoup({
    super.key,
    required this.title,
    required this.description,
    this.buttontext,
    // required this.function,
    required this.productList,
  });

  final String title;
  final String description;
  final String? buttontext;
  // final VoidCallback function;
  final List<HomeSoupCardModel> productList;
  ////
  int numofRow({required int numofColumn, required int listLenght}) {
    double rowIndexA = (listLenght / numofColumn);
    int rowIndexB = (listLenght / numofColumn).floor();
    if (rowIndexA != rowIndexB) {
      return (rowIndexB + 1);
    } else {
      return (rowIndexB);
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    bool desktop = (ResponsiveScreenView.isDesktop(context));
    bool tablet = (ResponsiveScreenView.isTablet(context));
    var provider = Provider.of<SoupCardProvider>(
      context,
    );

    int numOfColumn = desktop
        ? 4
        : (tablet)
            ? 3
            : 2;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: media.width * .9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HeaderBoldText(
                text: title,
                size: widescreen ? null : 16,
              ),
              // AppTextButton1(
              //     label: 'View all', function: function, textsize: 13),
            ],
          ),
          const SizedBox(height: 15),
          BodyText(text: description, maxLines: 2),
          const SizedBox(height: 15),
          AppGridWidget(
            rowNum: numofRow(
                numofColumn: numOfColumn, listLenght: productList.length),
            columnNum: numOfColumn,
            widgetList: productList
                .map((e) => HomeSoupCard(
                      id: e.id,
                      image: e.image,
                      title: e.title,
                      description: e.description,
                      fav: e.fav,
                      favourite: () {
                        provider.isfavourite(e.id);
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}





//////////////////
// class AppGridWidget extends StatelessWidget {
//   final int rowNum;
//   final int columnNum;
//   final List<Widget> widgetList;

//   const AppGridWidget({super.key, required this.rowNum, required this.columnNum, required this.widgetList});

//   List<List<Widget>> _generateMatrix() {
//     List<Widget> filledWidgets = List<Widget>.from(widgetList);
//     for (int i = filledWidgets.length; i < rowNum * columnNum; i++) {
//       filledWidgets.add(Container()); // Fill in missing positions with empty containers
//     }

//     List<List<Widget>> matrix = List.generate(rowNum, (index) {
//       int startIndex = index * columnNum;
//       return filledWidgets.sublist(startIndex, startIndex + columnNum);
//     });

//     return matrix;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<List<Widget>> matrix = _generateMatrix();

//     return Column(mainAxisSize: MainAxisSize.min,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         for (var row in matrix)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: row,
//           ),
//       ],
//     );
//   }
// }

  // child: LayoutGrid(
            //   columnSizes: widescreen ? [auto, auto, auto, auto] : [auto, auto],
            //   rowSizes: widescreen ? widescreenRow : mobileRow,
            //   columnGap: 15,
            //   gridFit: GridFit.expand,
            //   rowGap: 15,
            //   autoPlacement: AutoPlacement.columnDense,
            //   children: productList
            //       .map(
            //         (e) => AppProductDisplayCard(
            //           id: e.id,
            //           image: e.image,
            //           title: e.title,
            //           description: e.description,
            //           price: e.price,
            //           stars: e.stars,
            //           addToCart: () {
            //             provider.addtocart(e.id);
            //           },
            //           isfavourite: () {
            //             provider.isfavourite(e.id);
            //           },
            //         ),
            //       )
            //       .toList(),
            // ),




             // SizedBox(
          //   height: 500,
          //   width: media.width * .9,
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: (media.width * .9 / 200).floor(),
          //       mainAxisSpacing: 8.0,
          //       crossAxisSpacing: 8.0,
          //     ),
          //     itemCount: 4,
          //     itemBuilder: (context, index) {
          //       return AppProductDisplayCard(
          //         id: productList[index].id,
          //         image: productList[index].image,
          //         title: productList[index].title,
          //         description: productList[index].description,
          //         price: productList[index].price,
          //         stars: productList[index].stars,
          //         addToCart: () {
          //           provider.addtocart(productList[index].id);
          //         },
          //         isfavourite: () {
          //           provider.isfavourite(productList[index].id);
          //         },
          //       );
          //     },
          //   ),
          // )

          ////////////////////////
          // Align(
          //   alignment: Alignment.center,
          //   child: Wrap(
          //     spacing: 20, runSpacing: 20,
          //     // crossAxisAlignment: WrapCrossAlignment.start,
          //     // alignment: WrapAlignment.spaceBetween,
          // children: productList
          //     .map(
          //       (e) => AppProductDisplayCard(
          //           image: e.image,
          //           title: e.title,
          //           description: e.description,
          //           price: e.price,
          //           stars: e.stars,
          //           addToCart: () {}),
          //     )
          //     .toList(),
          //   ),
          // )
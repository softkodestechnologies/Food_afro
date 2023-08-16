import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/widgets/home_category_card.dart';
import 'package:food_afro_bean/model/dummy_categories.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

class HomeCategorySection extends StatefulWidget {
  const HomeCategorySection({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  State<HomeCategorySection> createState() => _HomeCategorySectionState();
}

class _HomeCategorySectionState extends State<HomeCategorySection> {
  late final ScrollController _scrollController;
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  List<DummyCategoryDetails> category = [
    DummyCategoryDetails(
      image: 'assets/images/drinks.svg',
      function: () {},
    ),
    DummyCategoryDetails(
      image: 'assets/images/fish.svg',
      function: () {},
    ),
    DummyCategoryDetails(
      image: 'assets/images/fruits.svg',
      function: () {},
    ),
    DummyCategoryDetails(
      image: 'assets/images/grain.svg',
      function: () {},
    ),
    DummyCategoryDetails(
      image: 'assets/images/snacks.svg',
      function: () {},
    ),
    DummyCategoryDetails(
      image: 'assets/images/vegetables.svg',
      function: () {},
    ),
  ];
  void goforward() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    // if (page < category.length) {

    // }
  }

  void gobackward() {
    _scrollController.animateTo(
      1000,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    // if (page > 0) {

    // }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: media.width * .9,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HeaderBoldText(
              text: widget.title,
              size: widescreen ? null : 16,
            ),
            SizedBox(
              width: 100,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppImageIconButton(
                      size: 30,
                      image: 'assets/images/leftArrow.svg',
                      function: () {
                        setState(() {
                          goforward();
                        });
                      },
                    ),
                    AppImageIconButton(
                      size: 30,
                      image: 'assets/images/rightArrow.svg',
                      function: () {
                        setState(() {
                          gobackward();
                        });
                      },
                    ),
                  ]),
            )
          ],
        ),
        const SizedBox(height: 15),
        BodyText(text: widget.description, maxLines: 2),
        const SizedBox(height: 15),
        SizedBox(
            height: widescreen ? 240 : 140,
            width: media.width * .9,
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return HomeCategoryCard(
                    image: category[index].image,
                    function: category[index].function);
                // return category
                //     .map((e) => HomeCategoryCard(
                //           image: e.image,
                //           function: e.function,
                //         ))
                //     .toList();
              },
            )
            // child: SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   controller: _scrollController,
            //   child: ,
            // ),
            )
      ]),
    );
  }
}

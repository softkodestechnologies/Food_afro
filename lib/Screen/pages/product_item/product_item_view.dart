import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/product_item/product_item_page.dart';
import 'package:food_afro_bean/Screen/screen_widgets/footer/screen_footer.dart';
import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header.dart';
import 'package:food_afro_bean/util/app_color.dart';

class ProductItemPageView extends StatefulWidget {
  const ProductItemPageView({super.key, this.id});
  static const routeName = '/product item page';
  final String? id;
  @override
  State<ProductItemPageView> createState() => _ProductItemPageViewState();
}

class _ProductItemPageViewState extends State<ProductItemPageView> {
  late final ScrollController _scrollController;
  bool _showFAB = false;
  @override
  void initState() {
    // TODO: implement initStatew
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels !=
          _scrollController.position.minScrollExtent) {
        setState(() {
          _showFAB = true;
        });
      } else {
        setState(() {
          _showFAB = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController.dispose();
    super.dispose();
  }

  void gotobegining() {
    _scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
              controller: _scrollController,
              child: const Column(
                children: [
                  SizedBox(height: 130),
                  ProductItemScreen(),
                  ScreenFooter(),
                ],
              )),
          Positioned(
              bottom: 100,
              right: 30,
              child: (_showFAB)
                  ? FloatingActionButton(
                      onPressed: gotobegining,
                      backgroundColor: AppColors.touchColor,
                      foregroundColor: Colors.white,
                      child: const Icon(Icons.arrow_upward),
                    )
                  : const SizedBox()),
          const ScreenHeader(),
        ],
      ),
    );
  }
}

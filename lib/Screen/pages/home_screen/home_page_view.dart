import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/home_page.dart';
import 'package:food_afro_bean/Screen/screen_widgets/footer/screen_footer.dart';
import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';

class HomePageView extends StatefulWidget {
  static const routeName = '/homepage';
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late final ScrollController _scrollController;
  bool _showFAB = false;
  @override
  void initState() {
    // TODO: implement initState
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
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              controller: _scrollController,
              child: const Column(
                children: [
                  SizedBox(height: 130),
                  HomePage(),
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

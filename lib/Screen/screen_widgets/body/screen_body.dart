// import 'package:flutter/material.dart';
// import 'package:food_afro_bean/Screen/pages/home_screen/home_page.dart';
// import 'package:food_afro_bean/Screen/screen_widgets/footer/screen_footer.dart';
// import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header.dart';
// import 'package:food_afro_bean/provider/screen_navigation_provider.dart';
// // import 'package:food_afro_bean/util/responsive_screen.dart';
// import 'package:provider/provider.dart';

// class ScreenBody extends StatefulWidget {
//   const ScreenBody({super.key});

//   @override
//   State<ScreenBody> createState() => _ScreenBodyState();
// }

// class _ScreenBodyState extends State<ScreenBody> {
//   late final ScrollController _scrollController;
//   bool _showFAB = false;
//   @override
//   void initState() {
//     // TODO: implement initState
//     _scrollController = ScrollController();

//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels !=
//           _scrollController.position.minScrollExtent) {
//         setState(() {
//           _showFAB = true;
//         });
//       } else {
//         setState(() {
//           _showFAB = false;
//         });
//       }
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void gotobegining() {
//     _scrollController.animateTo(
//       0,
//       duration: const Duration(milliseconds: 500),
//       curve: Curves.easeInOut,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
//     //     ResponsiveScreenView.isTablet(context));
//     // final screenprovider = Provider.of<ScreenNavigationProvider>(context);
//     return Scaffold(
//       // body: SingleChildScrollView(
//       //     child: Column(
//       //   children: [
//       //     const ScreenHeader(),
//       //     HomePage(),
//       //     ScreenFooter(),
//       //   ],
//       // )),
//       body: SizedBox(
//         height: double.infinity,
//         width: double.infinity,
//         child: Stack(
//           children: [
//             SingleChildScrollView(
//               controller: _scrollController,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: 140),
//                   if (screenprovider.screenpage == 1) const HomePage(),
//                   // if (provider.screenPage == 1) const FacilitiesScreenView(),
//                   // if (provider.screenPage == 2) const RoomScreenView(),
//                   // if (provider.screenPage == 3) const HomeScreenView(),
//                   const ScreenFooter(),
//                 ],
//               ),
//             ),
//             Positioned(
//                 bottom: 100,
//                 right: 30,
//                 child: (_showFAB)
//                     ? FloatingActionButton(
//                         onPressed: gotobegining,
//                         child: const Icon(Icons.arrow_upward),
//                       )
//                     : const SizedBox()),
//             const ScreenHeader(),
//           ],
//         ),
//       ),
//     );
//   }
// }

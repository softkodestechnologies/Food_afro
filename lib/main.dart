import 'package:flutter/material.dart';
import 'package:food_afro_bean/Screen/pages/aut_screen/aut_screen.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/home_page_view.dart';
import 'package:food_afro_bean/Screen/pages/product_screen/product_page_view.dart';
import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header_search_page.dart';
import 'package:food_afro_bean/provider/auth_provider.dart';
import 'package:food_afro_bean/provider/dropdown_provider.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/provider/screen_navigation_provider.dart';
import 'package:food_afro_bean/provider/soup_lists_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => DropDownProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ScreenNavigationProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ProductListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => SoupCardProvider(),
      ),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Afro Bean',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Satoshi',
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(202, 67, 20, 1)),
        useMaterial3: true,
      ),
      home: const HomePageView(),
      routes: {
        ScreenHeaderSearchPage.routeName: (context) =>
            const ScreenHeaderSearchPage(),
        AuthScreen.routeName: (context) => const AuthScreen(),
        ProductPageView.routeName: (context) => const ProductPageView(),
      },
    );
  }
}

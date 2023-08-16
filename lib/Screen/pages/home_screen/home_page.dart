import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/sections/home_category.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/sections/home_wallpaper.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/sections/home_wallpaper2.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_body_section.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var productlistprovider = Provider.of<ProductListProvider>(context);
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widescreen ? media.width * 0.05 : 10),
      margin: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
       
        child: Column(
          children: [
            const HomeScreenWallpaperSection(),
            // AppBodySpliteSection(),
            AppBodySpliteSection(
                title: 'Most requested products',
                description:
                    'Discover our top-requested products across Europe!',
                function: () {},
                productList: productlistprovider.mostRequestedProducts),
//////////////

            const HomeCategorySection(
              title: 'Category',
              description:
                  'Discover your needs with our comprehensive category list.',
            ),
////////////////

            AppBodySpliteSection(
                title: 'Recommended products',
                description: 'Explore essential products for your needs',
                function: () {},
                productList: productlistprovider.allproducts),

            ///////////
            ///
            const HomeScreenWallpaper2Section(),

          
          ],
        ),
      ),
    );
  }
}

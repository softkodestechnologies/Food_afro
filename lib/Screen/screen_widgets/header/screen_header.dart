import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/Screen/pages/aut_screen/aut_screen.dart';
import 'package:food_afro_bean/Screen/pages/cart/cart_pageview.dart';
import 'package:food_afro_bean/Screen/pages/home_screen/home_page_view.dart';
import 'package:food_afro_bean/Screen/pages/product_screen/product_page_view.dart';
import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header_search_page.dart';
import 'package:food_afro_bean/Screen/screen_widgets/header/screen_header_text_button_list.dart';
import 'package:food_afro_bean/provider/auth_provider.dart';
import 'package:food_afro_bean/provider/product_lists_provider.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_Item_count.dart';
import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_profileIandT.dart';
import 'package:food_afro_bean/widgets/app_search_bar.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:provider/provider.dart';

////
bool _moble = false;
bool _category = false;

///
///
class ScreenHeader extends StatefulWidget {
  const ScreenHeader({super.key});

  @override
  State<ScreenHeader> createState() => _ScreenHeaderState();
}

class _ScreenHeaderState extends State<ScreenHeader> {
  bool _navBar = false;
  void mobileresponce() {
    setState(() {
      _navBar = !_navBar;
      _moble = !_moble;
    });
  }

  void desktopcategorySelected() {
    setState(() {
      /// categories function
    });
  }

  bool showContent = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return AnimatedContainer(
      duration: const Duration(microseconds: 345),
      height: (_category && widescreen)
          ? 340
          : (!widescreen)
              ? 210
              : 130,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            children: [
              HeaderMainBar(menuFuntion: mobileresponce),
              HeaderBrownBar(categoryshowfunction: () {
                if (widescreen) {
                  setState(() {
                    _category = !_category;
                  });
                } else {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      return !widescreen
                          ? const HeaderMobileScreenCategorySelected()
                          : const SizedBox();
                    },
                  );
                  // mobile show bottom modle sheet
                }
              }),
              // if (_category && widescreen)
              // ignore: prefer_const_constructors
              if (widescreen) HeaderWideScreenCategorySelected()
            ],
          ),
          Positioned(
              top: 2,
              child: (widescreen)
                  ? const SizedBox()
                  : AnimatedContainer(
                      color: const Color.fromRGBO(245, 245, 245, 1),
                      padding: const EdgeInsets.all(10),
                      duration: const Duration(seconds: 2),
                      height: _navBar ? 250 : 0,
                      width: _navBar ? media.width : 0,
                      curve: Curves.easeInOut,
                      onEnd: () => setState(() {
                        showContent = !showContent;
                      }),
                      child: showContent
                          ? AnimatedOpacity(
                              opacity: _navBar ? 1.0 : 0.0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                              child: Column(
                                children: [
                                  HeaderMobileSideMenu1(
                                      menuFunction: mobileresponce),
                                  const HeaderMobileSideMenu2()
                                ],
                              ),
                            )
                          : const SizedBox(),
                    ))
        ],
      ),
    );
  }
}

// Mobile Header side bar
// first bar
class HeaderMobileSideMenu1 extends StatelessWidget {
  const HeaderMobileSideMenu1({super.key, required this.menuFunction});
  final VoidCallback menuFunction;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductListProvider>(context);
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: widescreen ? 40 : 30,
            width: widescreen ? 85 : 55,
            child:
                SvgPicture.asset('assets/images/logo3.svg', fit: BoxFit.fill),
          ),
          SizedBox(
            child: Row(children: [
              AppItemCount1(
                  function: () {
                    Navigator.pushNamed(context, CartPageView.routeName);
                  },
                  lablel: 'Cart',
                  image: 'assets/images/bag.svg',
                  count: provider.usercart.length),
              const SizedBox(width: 15),
              AppImageIconButton(
                  image: 'assets/images/search.svg',
                  function: () {
                    Navigator.pushNamed(
                        context, ScreenHeaderSearchPage.routeName);
                  }),
              const SizedBox(width: 15),
              AppImageIconButton(
                  image: 'assets/images/close.svg', function: menuFunction),
            ]),
          )
        ],
      ),
    );
  }
}

// first bar

class HeaderMobileSideMenu2 extends StatelessWidget {
  const HeaderMobileSideMenu2({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: authProvider.userAuthenticated
          ? Container(
              padding: const EdgeInsets.all(10),
              height: 40,
              width: media.width * .8,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: AppColors.themeColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const AppProfileAndText(
                  name: 'James', image: 'assets/images/profile.png'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton1(
                  label: 'Sign up',
                  function: () {
                    authProvider.signin = false;
                    Navigator.pushNamed(context, AuthScreen.routeName);
                  },
                  width: media.width * .8,
                ),
                const SizedBox(height: 20),
                AppButton2(
                  label: 'Sign in',
                  function: () {
                    authProvider.signin = true;
                    Navigator.pushNamed(context, AuthScreen.routeName);
                    // authProvider.signIn();
                  },
                  width: media.width * .8,
                ),
              ],
            ),
    );
  }
}
////////////////////////////////////////////////////////////////////////////////

class HeaderMainBar extends StatefulWidget {
  const HeaderMainBar({super.key, required this.menuFuntion});
  final VoidCallback menuFuntion;
  @override
  State<HeaderMainBar> createState() => _HeaderMainBarState();
}

class _HeaderMainBarState extends State<HeaderMainBar> {
  @override
  Widget build(BuildContext context) {
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    final authProvider = Provider.of<AuthProvider>(context);
    var provider = Provider.of<ProductListProvider>(context);
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      width: double.infinity,
      alignment: Alignment.center,
      height: widescreen ? 80 : (_moble ? 160 : 80),
      color: AppColors.themeColor,
      child: widescreen
          ? Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                width: 420,
                child: Row(children: [
                  SizedBox(
                    height: widescreen ? 40 : 25,
                    width: widescreen ? 85 : 45,
                    child: SvgPicture.asset('assets/images/logo3.svg',
                        fit: BoxFit.fill),
                  ),
                  const SizedBox(width: 5),
                  AppSearchBar1(
                    width: 315,
                    searchQuery: '',
                    suggestions: const [''],
                  ),
                ]),
              ),
              SizedBox(
                width: 330,
                child: Row(children: [
                  SizedBox(
                    width: authProvider.userAuthenticated ? 180 : 90,
                    child: Row(children: [
                      // AppItemCount1
                      if (authProvider.userAuthenticated)
                        const AppItemCount1(
                            lablel: 'Orders',
                            image: 'assets/images/lists.svg',
                            count: 4),
                      const Spacer(),
                      AppItemCount1(
                          lablel: 'Cart',
                          image: 'assets/images/bag.svg',
                          function: () {
                            Navigator.pushNamed(
                                context, CartPageView.routeName);
                          },
                          count: provider.usercart.length),
                    ]),
                  ),
                  const Spacer(),
                  authProvider.userAuthenticated
                      ? const AppProfileAndText(
                          name: 'James...........',
                          image: 'assets/images/profile.png')
                      : SizedBox(
                          width: 150,
                          child: Row(
                            children: [
                              AppButton1(
                                label: 'Sign up',
                                function: () {
                                  authProvider.signin = false;
                                  Navigator.pushNamed(
                                      context, AuthScreen.routeName);
                                },
                                width: 67,
                                height: 40,
                              ),
                              const Spacer(),
                              AppButton2(
                                label: 'Sign in',
                                function: () {
                                  authProvider.signin = true;
                                  Navigator.pushNamed(
                                      context, AuthScreen.routeName);
                                  // authProvider.signIn();
                                },
                                width: 67,
                                height: 40,
                              )
                            ],
                          ),
                        )
                ]),
              )
            ])
          :

          /// mobile
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(width: 5),
                SizedBox(
                  height: widescreen ? 40 : 30,
                  width: widescreen ? 105 : 75,
                  child: SvgPicture.asset('assets/images/logo3.svg',
                      fit: BoxFit.fill),
                ),
                const SizedBox(width: 20),
                AppItemCount1(
                    lablel: 'Cart',
                    image: 'assets/images/bag.svg',
                    function: () {
                      Navigator.pushNamed(context, CartPageView.routeName);
                    },
                    count: provider.usercart.length),
                const SizedBox(width: 50),
                IconButton(
                    onPressed: widget.menuFuntion, icon: const Icon(Icons.menu))
              ],
            ),
    );
  }
}

class HeaderBrownBar extends StatelessWidget {
  const HeaderBrownBar({super.key, required this.categoryshowfunction});
  final VoidCallback? categoryshowfunction;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      color: AppColors.touchColor,
      alignment: Alignment.center,
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, HomePageView.routeName);
          },
          child: SizedBox(
            child: Row(children: [
              const BodyText(text: 'Category', color: Colors.white),
              IconButton(
                  onPressed: categoryshowfunction,
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 20,
                  ))
            ]),
          ),
        ),
        const SizedBox(width: 5),
        const BodyText(text: '|', color: Colors.white),
        const SizedBox(width: 5),
        InkWell(
            onTap: () {
              Navigator.pushReplacementNamed(
                  context, ProductPageView.routeName);
            },
            child: const BodyText(text: 'Products', color: Colors.white)),
        const SizedBox(width: 5),
        const BodyText(text: '|', color: Colors.white),
        const SizedBox(width: 5),
        const BodyText(text: 'Recipes', color: Colors.white),
        const SizedBox(width: 5),
      ]),
    );
  }
}

class HeaderWideScreenCategorySelected extends StatelessWidget {
  const HeaderWideScreenCategorySelected({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _category ? 1 : 0,
      duration: const Duration(seconds: 1),
      child: AnimatedContainer(
        duration: const Duration(microseconds: 345),
        width: double.infinity,
        height: _category ? 210 : 0,
        color: AppColors.backgroundGray,
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
// ScreenHeaderTextButtonList
            ScreenHeaderTextButtonList(
              title: 'Vegetable',
              labels: const [
                'Ugwu leaf',
                'Water leaf',
                'Bitter leaf',
                'Afang leaf'
              ],
              functions: [
                () {}, //  according to label
                () {},
                () {},
                () {},
              ],
            ),
            ScreenHeaderTextButtonList(
              title: 'Fruit',
              labels: const ['Agbalumo', 'Sugar cane', 'Bush mango', 'Atarodo'],
              functions: [
                () {}, //  according to label
                () {},
                () {},
                () {},
              ],
            ),
            ScreenHeaderTextButtonList(
              title: 'Frozen Food',
              labels: const ['Stock fish', 'Ice fish', 'Periwinkle', 'Cat fsh'],
              functions: [
                () {}, //  according to label
                () {},
                () {},
                () {},
              ],
            ),
            ScreenHeaderTextButtonList(
              title: 'Snacks',
              labels: const [
                'Cheese balls',
                'Chin-Chin',
                'Plantain Chips',
                'Buscuit'
              ],
              functions: [
                () {}, //  according to label
                () {},
                () {},
                () {},
              ],
            ),
            ScreenHeaderTextButtonList(
              title: 'Drinks',
              labels: const ['Stock fish', 'Ice fish', 'Periwinkle', 'Cat fsh'],
              functions: [
                () {}, //  according to label
                () {},
                () {},
                () {},
              ],
            ),
            ScreenHeaderTextButtonList(
              title: 'Grains',
              labels: const ['Garri', 'Honey beans', 'Rice', 'Wheat'],
              functions: [
                () {}, //  according to label
                () {},
                () {},
                () {},
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//////////////////////
class HeaderMobileScreenCategorySelected extends StatelessWidget {
  const HeaderMobileScreenCategorySelected({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Container(
        height: media.height * .7,
        width: double.infinity,
        color: AppColors.backgroundGray,
        padding: const EdgeInsets.only(right: 10, left: 10, top: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: AppImageIconButton(
                  image: 'assets/images/close.svg',
                  function: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeaderTextButtonList(
                    title: 'Vegetable',
                    labels: const [
                      'Ugwu leaf',
                      'Water leaf',
                      'Bitter leaf',
                      'Afang leaf'
                    ],
                    functions: [
                      () {}, //  according to label
                      () {},
                      () {},
                      () {},
                    ],
                  ),
                  ScreenHeaderTextButtonList(
                    title: 'Fruit',
                    labels: const [
                      'Agbalumo',
                      'Sugar cane',
                      'Bush mango',
                      'Atarodo'
                    ],
                    functions: [
                      () {}, //  according to label
                      () {},
                      () {},
                      () {},
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeaderTextButtonList(
                    title: 'Frozen Food',
                    labels: const [
                      'Stock fish',
                      'Ice fish',
                      'Periwinkle',
                      'Cat fsh'
                    ],
                    functions: [
                      () {}, //  according to label
                      () {},
                      () {},
                      () {},
                    ],
                  ),
                  ScreenHeaderTextButtonList(
                    title: 'Snacks',
                    labels: const [
                      'Cheese balls',
                      'Chin-Chin',
                      'Plantain Chips',
                      'Buscuit'
                    ],
                    functions: [
                      () {}, //  according to label
                      () {},
                      () {},
                      () {},
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ScreenHeaderTextButtonList(
                    title: 'Drinks',
                    labels: const [
                      'Stock fish',
                      'Ice fish',
                      'Periwinkle',
                      'Cat fsh'
                    ],
                    functions: [
                      () {}, //  according to label
                      () {},
                      () {},
                      () {},
                    ],
                  ),
                  ScreenHeaderTextButtonList(
                    title: 'Grains',
                    labels: const ['Garri', 'Honey beans', 'Rice', 'Wheat'],
                    functions: [
                      () {}, //  according to label
                      () {},
                      () {},
                      () {},
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ));
  }
}

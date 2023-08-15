import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_search_bar.dart';

class ScreenHeaderSearchPage extends StatelessWidget {
  const ScreenHeaderSearchPage({super.key});
  static const routeName = '/screen_header+search_page';
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding:
            EdgeInsets.symmetric(horizontal: media.width * .05, vertical: 20),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: AppImageIconButton(
                  image: 'assets/images/close.svg',
                  function: () {
                    Navigator.pop(context);
                  }),
            ),
            const SizedBox(height: 15),
            AppSearchBar1(
              suggestions: const [
                'White Garri',
                'White Garri cassava',
                'White Garri ijebu'
              ],
              searchQuery: 'White Garri',
              width: media.width * .9,
            ),

            const SizedBox(height: 15),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Color.fromRGBO(245, 245, 245, 1),
            //       borderRadius: BorderRadius.circular(5)),
            // ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';

// class AppSearchBar extends StatelessWidget {
//   const AppSearchBar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5), color: Colors.white),
//       height: 45,
//       width: 400,
//       padding: const EdgeInsets.all(8),
//       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//      SizedBox   (
//           width: 250,
//           child: TextField(),
//         ),
//         SizedBox(width: 20),
//         AppButton1(
//           label: 'Search',
//           function: () {},
//           width: 70,
//         )
//       ]),
//     );
//   }
// }

// ignore: must_be_immutable
class AppSearchBar1 extends StatefulWidget {
  AppSearchBar1(
      {super.key,
      required this.suggestions,
      required this.searchQuery,
      this.height,
      required this.width,
      this.onSelected,
      this.function});
  List<String> suggestions;

  String searchQuery;
  final double width;
  final double? height;
  VoidCallback? function;
  void Function(String)? onSelected;
  @override
  State<AppSearchBar1> createState() => _AppSearchBar1State();
}

class _AppSearchBar1State extends State<AppSearchBar1> {
  @override
  Widget build(BuildContext context) {
    return Autocomplete<String>(
      optionsBuilder: (textEditingValue) {
        return widget.suggestions.where((suggestion) => suggestion
            .toLowerCase()
            .contains(textEditingValue.text.toLowerCase()));
      },
      onSelected: widget.onSelected,
      fieldViewBuilder:
          (context, textEditingController, focusNode, onFieldSubmitted) {
        return Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(245, 245, 245, 1)),
          height: widget.height ?? 45,
          width: widget.width,
          padding: const EdgeInsets.all(8),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
                width: (widget.width - 90),
                child: TextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      prefixIconConstraints: const BoxConstraints(
                        maxHeight: 17,
                      ),
                      prefixIcon: SizedBox(
                        width: 25,
                        child: SvgPicture.asset('assets/images/search.svg',
                            height: 17, width: 17),
                      ),
                      hintText: 'Search by item eg garri, crayfish',
                      hintStyle: const TextStyle(
                        fontFamily: 'Satoshi',
                        color: Color.fromRGBO(132, 132, 132, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                )),
            const SizedBox(width: 10),
            AppButton1(
              label: 'Search',
              function: () {},
              width: 60,
            )
          ]),
        );

        // return Row(
        //   children: [
        //     SizedBox(
        //       width: widget.width ?? 300,
        //       height: widget.height ?? 50,
        // child: TextField(
        //   controller: textEditingController,
        //   focusNode: focusNode,
        //   onChanged: widget.onSelected,
        //   // onChanged: (value) {
        //   //   setState(() {
        //   //     widget.searchQuery = value;
        //   //   });
        //   // },
        //   decoration: InputDecoration(
        //     hintText: 'Search...',
        //     border: OutlineInputBorder(
        //       borderRadius: BorderRadius.circular(10),
        //     ),
        //   ),
        // ),
        //     ),
        //   ],
        // );
      },
      optionsViewBuilder: (context, onSelected, options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: AppColors.backgroundGray,
            elevation: 4.0,
            child: SizedBox(
              height: 150,
              width: widget.width,
              child: ListView(
                children: options
                    .map((String option) => ListTile(
                          title: BodyText(
                            text: option,
                          ),
                          onTap: () {
                            onSelected(option);
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}

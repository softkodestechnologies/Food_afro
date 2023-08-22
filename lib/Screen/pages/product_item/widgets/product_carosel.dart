import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';

class ProductItemCarosel extends StatefulWidget {
  const ProductItemCarosel(
      {super.key, this.width, this.height, required this.images});

  final double? width;
  final double? height;
  final List<String> images;

  @override
  State<ProductItemCarosel> createState() => _ProductItemCaroselState();
}

class _ProductItemCaroselState extends State<ProductItemCarosel> {
  late final CarouselController _carouselController;

  @override
  void initState() {
    // TODO: implement initState
    _carouselController = CarouselController();
    super.initState();
  }

  // int pageIdex = 0;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    bool desktop = ResponsiveScreenView.isDesktop(context);
    bool tablet = ResponsiveScreenView.isTablet(context);

    List<Widget> a = widget.images
        .map((e) => GestureDetector(
              onTap: () {
                _carouselController.jumpToPage(widget.images.indexOf(e));
              },
              child: Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.all(5),
                child: Image.asset(e),
              ),
            ))
        .toList();

    List<Widget> b = [
      SizedBox(
        height: widget.height ?? 400,
        width: desktop
            ? widget.width ?? 400
            : tablet
                ? media.width * .4
                : media.width * .9,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CarouselSlider(
                carouselController: _carouselController,
                items: widget.images.map((e) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    height: widescreen ? widget.height ?? 400 : null,
                    width: desktop
                        ? widget.width ?? 400
                        : tablet
                            ? media.width * .4
                            : media.width * .9,
                    child: Image.asset(
                      e,
                      fit: BoxFit.fill,
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  initialPage: 1,
                  height: 600,
                  viewportFraction: 1,
                )),
            SizedBox(
              width: desktop
                  ? widget.width ?? 400
                  : tablet
                      ? media.width * .4
                      : media.width * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppImageIconButton(
                    size: 35,
                    image: 'assets/images/leftArrow.svg',
                    function: () {
                      setState(() {
                        _carouselController.previousPage();
                      });
                    },
                  ),
                  AppImageIconButton(
                    size: 35,
                    image: 'assets/images/rightArrow.svg',
                    function: () {
                      setState(() {
                        _carouselController.nextPage();
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      SizedBox(
        width: desktop
            ? widget.width
            : tablet
                ? media.width * .4
                : media.width * .8,
        // width: widescreen ? null : 400,
        // height: widescreen ? 400 : null,
        child: desktop
            ? Column(children: a)
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal, child: Row(children: a)),
      ),
      const SizedBox(height: 10, width: 10),
    ];

    return desktop ? Row(children: b) : Column(children: b);
  }
}

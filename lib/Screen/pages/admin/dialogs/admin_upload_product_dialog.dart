import 'dart:html' as html;
// import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
// import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_afro_bean/Screen/pages/admin/widgets/admin_welcome_bar1.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_field.dart';

class AdminUploadProductDialog extends StatefulWidget {
  const AdminUploadProductDialog({super.key});

  @override
  State<AdminUploadProductDialog> createState() =>
      _AdminUploadProductDialogState();
}

class _AdminUploadProductDialogState extends State<AdminUploadProductDialog> {
  late final TextEditingController productname;
  late final TextEditingController productdescription;
  late final TextEditingController productfeatures;

  @override
  void initState() {
    productname = TextEditingController();
    productdescription = TextEditingController();
    productfeatures = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    productname.dispose();
    productdescription.dispose();
    productfeatures.dispose();
    super.dispose();
  }

  List<Widget> images = [];
  void _pickAndDisplayImage() {
    final uploadInput = html.FileUploadInputElement()..accept = 'image/*';
    uploadInput.multiple = true;

    uploadInput.click();

    uploadInput.onChange.listen((e) {
      if (uploadInput.files!.isNotEmpty) {
        final file = uploadInput.files![0];
        final imageUrl = html.Url.createObjectUrlFromBlob(file);

        setState(() {
          images.add(
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              height: 200,
              child: Image.network(
                imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    // bool desktop = ResponsiveScreenView.isDesktop(context);
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));
    return Container(
      color: Colors.white,
      height: media.height * .9,
      width: media.width * .8,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 25,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widescreen
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const AdminWelcomeBar1(
                          title: 'Upload new product',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                      const Spacer(),
                      AppImageIconButton(
                        image: 'assets/images/close.svg',
                        function: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppImageIconButton(
                          image: 'assets/images/close.svg',
                          function: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const AdminWelcomeBar1(
                          title: 'Upload new product',
                          detail:
                              'Lorem ipsum dolor sit amet consectetur. Lorem velit adipiscing mattis nam. Suspendisse sit facilisis erat metus libero nisi volutpat turpis.'),
                    ],
                  ),
            const SizedBox(height: 20),
            Container(
              height: 300,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(children: [
                const SizedBox(width: 5),
                if (images.length <= 6)
                  InkWell(
                    onTap: _pickAndDisplayImage,
                    child: DottedBorder(
                      radius: const Radius.circular(10),
                      color: AppColors.complementColor,
                      dashPattern: const [13],
                      child: Container(
                        width: 300,
                        height: 300,
                        alignment: Alignment.center,
                        child: SvgPicture.asset('assets/images/upload.svg'),
                      ),
                    ),
                  ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 450,
                  height: 450,
                  child: GridView.builder(
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return images[index];
                      },
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3)),
                ),
              ]),
            ),
            const BodyText(
              text: 'Product Name',
              fontWeight: FontWeight.w600,
            ),
            AppTextField(
              edit: true,
              hintText: 'Enter product name',
              value: productname,
            ),
            const SizedBox(height: 20),
            const BodyText(
              text: 'Product Description',
              fontWeight: FontWeight.w600,
            ),
            AppTextField(
              edit: true,
              maxlines: 7,
              hintText: 'Describe product',
              value: productdescription,
            ),
            const SizedBox(height: 20),
            const BodyText(
              text: 'Key Feature',
              fontWeight: FontWeight.w600,
            ),
            AppTextField(
              edit: true,
              maxlines: 12,
              hintText: 'List Key Features',
              value: productfeatures,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

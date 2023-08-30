import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:html' as html;
import 'package:food_afro_bean/Screen/pages/admin/widgets/product_pic_remove.dart';
import 'package:food_afro_bean/util/app_color.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';
// import 'package:food_afro_bean/widgets/app_button.dart';
import 'package:food_afro_bean/widgets/app_image_icon_button.dart';
import 'package:food_afro_bean/widgets/app_text.dart';
import 'package:food_afro_bean/widgets/app_text_field.dart';

class AdminUploadProductEditDialog extends StatefulWidget {
  const AdminUploadProductEditDialog({super.key});

  @override
  State<AdminUploadProductEditDialog> createState() =>
      _AdminUploadProductEditDialogState();
}

class _AdminUploadProductEditDialogState
    extends State<AdminUploadProductEditDialog> {
  late final TextEditingController productname;
  late final TextEditingController productdescription;
  late final TextEditingController productfeatures;

  bool edit = false;
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

  List<String> images = [
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
    'https://picsum.photos/250?image=9',
  ];

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
            imageUrl,
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool desktop = ResponsiveScreenView.isDesktop(context);

    // bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
    //     ResponsiveScreenView.isTablet(context));
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderBoldText(
                    text: 'Product',
                    size: desktop ? null : 17,
                  ),
                  const Spacer(),
                  const SizedBox(width: 10),
                  InkWell(
                      onTap: () {
                        setState(() {
                          edit = !edit;
                        });
                      },
                      child: Container(
                        width: 90,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundGray,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 40,
                        padding: const EdgeInsets.all(8),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/images/edit.svg'),
                              SmallBodyText(
                                text: edit ? 'Save' : 'Edit',
                                color: AppColors.complementColor,
                              )
                            ]),
                      )),
                  AppImageIconButton(
                    image: 'assets/images/close.svg',
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  const SizedBox(width: 5),
                  if (images.length < 6)
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
                          return ProductImageView(
                            showRemove: edit,
                            imageUrl: images[index],
                            funtion: () {
                              setState(() {
                                images.removeAt(index);
                              });
                            },
                          );
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3)),
                  ),
                ]),
              ),
            ),
            const BodyText(
              text: 'Product Name',
              fontWeight: FontWeight.w600,
            ),
            AppTextField(
              edit: edit,
              hintText: 'Enter product name',
              value: productname,
            ),
            const SizedBox(height: 20),
            const BodyText(
              text: 'Product Description',
              fontWeight: FontWeight.w600,
            ),
            AppTextField(
              edit: edit,
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
              edit: edit,
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

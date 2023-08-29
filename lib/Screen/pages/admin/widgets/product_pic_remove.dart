import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_button.dart';

class ProductImageView extends StatefulWidget {
  const ProductImageView(
      {super.key,
      required this.imageUrl,
      required this.funtion,
      required this.showRemove});

  final String imageUrl;
  final VoidCallback funtion;
  final bool showRemove;

  @override
  State<ProductImageView> createState() => _ProductImageViewState();
}

class _ProductImageViewState extends State<ProductImageView> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          show = value;
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            height: 200,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          widget.showRemove
              ? show
                  ? AppButton2(
                      label: 'Remove', width: 100, function: widget.funtion)
                  : const SizedBox()
              : const SizedBox()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_table_cell.dart';

class ProductTableItem extends StatelessWidget {
  const ProductTableItem(
      {super.key,
      required this.onchange,
      required this.values,
      required this.productId,
      required this.productDetails,
      required this.price,
      required this.quantity,
      required this.availableQuantity,
      required this.uploadDate,
      required this.function});
  final Function(bool?) onchange;
  final bool values;

  final String productId;

  final String productDetails;
  final double price;
  final int quantity;
  final int availableQuantity;
  final String uploadDate;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTableCell(
            label: '',
            borderBottom: true,
            width: 50,
            widget: Checkbox(value: values, onChanged: onchange),
          ),
          AppTableCell(
            label: productId,
            width: 120,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: productDetails,
            width: 200,
            borderBottom: true,
            maxline: 3,
            fontSize: 13,
          ),
          AppTableCell(
            label: '£ $price',
            width: 100,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: quantity.toString(),
            width: 100,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: availableQuantity.toString(),
            width: 120,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: uploadDate,
            width: 100,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: '',
            width: 50,
            borderBottom: true,
            fontSize: 13,
            widget: IconButton(
                onPressed: function, icon: const Icon(Icons.more_vert)),
          ),
        ],
      ),
    );
  }
}

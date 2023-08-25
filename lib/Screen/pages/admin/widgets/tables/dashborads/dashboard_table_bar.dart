import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_table_cell.dart';

class DashboradTableBar extends StatelessWidget {
  const DashboradTableBar(
      {super.key, required this.onchange, required this.values});

  final Function(bool?) onchange;
  final bool values;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          AppTableCell(
            label: '',
            borderBottom: true,
            width: 50,
            widget: Checkbox(value: values, onChanged: onchange),
          ),
          const AppTableCell(
            label: 'Product ID',
            width: 120,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Order Date',
            width: 100,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Product Details',
            width: 200,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Price',
            width: 100,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Quantity',
            width: 100,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Total Price',
            width: 170,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}

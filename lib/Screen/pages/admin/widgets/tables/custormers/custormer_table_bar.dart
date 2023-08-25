import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_table_cell.dart';

class CustomersTableBar extends StatelessWidget {
  const CustomersTableBar(
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
            label: 'Email Address',
            width: 250,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Number of Purchase',
            width: 180,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Total Amount Spent',
            width: 200,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          const AppTableCell(
            label: 'Sign up Date',
            width: 150,
            borderBottom: true,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
         
        ],
      ),
    );
  }
}

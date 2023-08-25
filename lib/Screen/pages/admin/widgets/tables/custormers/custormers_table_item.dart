import 'package:flutter/material.dart';
import 'package:food_afro_bean/widgets/app_table_cell.dart';

class CustomerTableItem extends StatelessWidget {
  const CustomerTableItem(
      {super.key,
      required this.onchange,
      required this.values,
      required this.emailaddress,
      required this.numberofpurchase,
      required this.totalamountspent,
      required this.signupdate,
      required this.function});
  final Function(bool?) onchange;
  final bool values;

  final String emailaddress;

  final int numberofpurchase;
  final double totalamountspent;
  final String signupdate;

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
            label: emailaddress,
            width: 250,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: numberofpurchase.toString(),
            width: 180,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: totalamountspent.toString(),
            width: 200,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: signupdate,
            width: 100,
            borderBottom: true,
            fontSize: 13,
          ),
          AppTableCell(
            label: '',
            width: 50,
            borderBottom: true,
            fontSize: 13,
            widget:
                IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ),
        ],
      ),
    );
  }
}

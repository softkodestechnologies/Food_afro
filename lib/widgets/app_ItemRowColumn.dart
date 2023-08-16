import 'package:flutter/material.dart';
import 'package:food_afro_bean/util/responsive_screen.dart';

class AppGridWidget extends StatelessWidget {
  final int rowNum;
  final int columnNum;
  final List<Widget> widgetList;

  const AppGridWidget(
      {super.key,
      required this.rowNum,
      required this.columnNum,
      required this.widgetList});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    bool widescreen = (ResponsiveScreenView.isDesktop(context) ||
        ResponsiveScreenView.isTablet(context));

    List<List<Widget>> _generateMatrix() {
      List<Widget> filledWidgets = List<Widget>.from(widgetList);
      for (int i = filledWidgets.length; i < rowNum * columnNum; i++) {
        filledWidgets.add(Container(
          width: widescreen
              ? 220
              : media.width *
                  .45, // the width should be the same as the product item card in the grid
        )); // Fill in missing positions with empty containers
      }

      List<List<Widget>> matrix = List.generate(rowNum, (index) {
        int startIndex = index * columnNum;
        return filledWidgets.sublist(startIndex, startIndex + columnNum);
      });

      return matrix;
    }

    List<List<Widget>> matrix = _generateMatrix();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var row in matrix)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: row,
          ),
      ],
    );
  }
}




//////////////////  simplified version for refrence only to who ever takes over 
// class MatrixWidget extends StatelessWidget {
//   final int rowNum;
//   final int columnNum;
//   final List<Widget> widgetList;

//   MatrixWidget({required this.rowNum, required this.columnNum, required this.widgetList});

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> filledWidgets = List<Widget>.from(widgetList);
//     while (filledWidgets.length < rowNum * columnNum) {
//       filledWidgets.add(Container());
//     }

//     List<Row> rows = [];
//     for (int rowIndex = 0; rowIndex < rowNum; rowIndex++) {
//       int startIndex = rowIndex * columnNum;
//       List<Widget> rowWidgets = filledWidgets.sublist(startIndex, startIndex + columnNum);
//       rows.add(Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: rowWidgets,
//       ));
//     }

//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: rows,
//     );
//   }
// }

// void main() {
//   runApp(MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(title: Text('Widget Matrix Widget Example')),
//       body: Center(
//         child: MatrixWidget(
//           rowNum: 3,
//           columnNum: 3,
//           widgetList: [
//             Container(color: Colors.red),
//             Container(color: Colors.green),
//             Container(color: Colors.blue),
//           ],
//         ),
//       ),
//     ),
//   ));
// }
import 'package:flutter/material.dart';

class DropDownProvider with ChangeNotifier {
  // String headerDropDown = 'Category';

  // void setHeaderText(String text) {
  //   headerDropDown = text;
  //   notifyListeners();
  // }


  List<String> listofvaluesforadminDD = [
    'This year',
    'This week',
    'This month',
  ];

  String adminorderDD = 'This year';
void setadminorderDD(String text) {
    adminorderDD = text;
    notifyListeners();
  }

//
  String admidashboardDD = 'This year';
void setadmidashboardDD(String text) {
    admidashboardDD = text;
    notifyListeners();
  }
  //
    String adminproductDD = 'This year';
void setadminproductDD(String text) {
    adminproductDD = text;
    notifyListeners();
  }
  //
    String admincustormerDD = 'This year';
void setadmincustormerDD(String text) {
    admincustormerDD = text;
    notifyListeners();
  }


















}

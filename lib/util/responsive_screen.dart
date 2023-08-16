import 'package:flutter/material.dart';

class ResponsiveScreenView {
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 750 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 750;
}


 int rowNum({required int numofColumn, required int listLenght}) {
      double rowIndexA = (listLenght / numofColumn);
      int rowIndexB = (listLenght / numofColumn).floor();
      
   
   if ( rowIndexA != rowIndexB){
     return (rowIndexB+1);
   }else{
     return (rowIndexB);
   }
    }
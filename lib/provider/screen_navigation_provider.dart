import 'package:flutter/material.dart';

class ScreenNavigationProvider with ChangeNotifier {
  int screenpage = 1;

  void setscreenPage(int page) {
    screenpage = page;
    notifyListeners();
  }
}

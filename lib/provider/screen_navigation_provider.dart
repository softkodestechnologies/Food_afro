import 'package:flutter/material.dart';

class ScreenNavigationProvider extends ChangeNotifier {
  int screenpage = 1;

  void setscreenPage(int page) {
    screenpage = page;
    notifyListeners();
  }
}

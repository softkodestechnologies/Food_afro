import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool userAuthenticated = false;
  // bool authSignedIn = false;
  bool signin = false;

  void userAuth() {
    userAuthenticated = !userAuthenticated;
    notifyListeners();
  }

  void signIn() {
    signin = !signin;

    notifyListeners();
  }
}

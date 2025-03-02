import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkTheme = false;
  void updateTheme() {
    try {
      isDarkTheme = !isDarkTheme;
      notifyListeners();
    } catch (ex) {
      print(ex);
    }
  }
}

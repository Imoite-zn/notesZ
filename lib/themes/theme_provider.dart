// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:to_do_app/themes/themes.dart';

class ThemeProvider with ChangeNotifier{
  //initially theme is light mode
  ThemeData _themeData = lightMode;

  //getter method to access the theme from other sections
  ThemeData get ThemeData => _themeData;

  //getter method to see if we are in dark mode or not
  bool get isDarkMode => _themeData == darkMode;

  //setter method to set new theme
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  //use this toggle switch
  void toggleTheme() {
    _themeData = _themeData == darkMode ? lightMode : darkMode;
  }
}
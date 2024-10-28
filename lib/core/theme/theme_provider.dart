import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {

  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  toggle(){
    if(themeData ==lightMode){
      themeData =darkMode;
    }else{
      themeData =lightMode;

    }
  }
}
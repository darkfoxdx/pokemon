import 'package:flutter/material.dart';

class ThemeUtil {
  static double borderRadius = 10.0;
  static ThemeData customize(ThemeData themeData) {
    return themeData.copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
        ),
        inputDecorationTheme: themeData.inputDecorationTheme.copyWith(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: themeData.unselectedWidgetColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            borderSide: BorderSide(color: themeData.primaryColor),
          ),
        ));
  }
}

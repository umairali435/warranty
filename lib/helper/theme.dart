import 'package:flutter/material.dart';
import 'package:warranty_watch/helper/constants.dart';

class CustomTheme {
  const CustomTheme._();
  static late final mainTheme = ThemeData(
    primaryColor: Constants.primaryColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: Constants.primaryColor,
      primaryVariant: Constants.primaryColor,
      secondary: Constants.primaryColor,
      secondaryVariant: Constants.primaryColor,
    ),
    primaryIconTheme: IconThemeData(color: Constants.black),
    appBarTheme: AppBarTheme(
      backgroundColor: Constants.whiteColor,
      iconTheme: IconThemeData(color: Constants.whiteColor),
      elevation: 0.1,
    ),
    scaffoldBackgroundColor: Constants.whiteColor,
    fontFamily: Constants.monstrat.fontFamily,
    textTheme: TextTheme(
      headline1: Constants.monstrat.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        height: 1.15,
      ),
      headline2: Constants.monstrat.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 50,
        height: 1.15,
      ),
      headline3: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 26,
        height: 1.15,
      ),
      headline4: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 26,
        height: 1.15,
      ),
      headline5: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        height: 1.15,
      ),
      headline6: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 20,
        height: 1.15,
      ),
      subtitle1: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w200,
      ),
      subtitle2: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w200,
      ),
      bodyText1: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w400,
      ),
      bodyText2: Constants.monstrat.copyWith(
        fontWeight: FontWeight.w400,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.all(0),
          textStyle: TextStyle(color: Constants.whiteColor),
          backgroundColor: Constants.primaryColor),
    ),
    iconTheme: const IconThemeData(color: Colors.black, size: 18),
  );
}

/// import classes from material flutter package.
import 'package:flutter/material.dart';

/// import `MyColors` from file.
import './myColors.dart';

/// Build a `ThemeData` object based on `MyColors` and `Brightness`.
ThemeData createNewTheme(MyColors myColors, Brightness brightness) {
  /// checks whether the theme is `dark` or `light`.
  final bool isDark = _isDark(brightness);

  /// if it `is dark`, set the text color to `white`,
  /// if it `is light` set the text color to `black`.
  final Color textColor = isDark ? myColors.white : myColors.black;

  /// return new `ThemeData` customized.
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: brightness,
    errorColor: myColors.error,
    primarySwatch: myColors.black,
    primaryColor: myColors.primary,
    accentColor: myColors.secondary,
    buttonColor: myColors.primary,
    hintColor: myColors.black[100],
    scaffoldBackgroundColor: myColors.white,
    textTheme: _getTextTheme(textColor),
    floatingActionButtonTheme: _getFabThemeData(textColor),
  );
}

/// checks whether the theme is `dark` or `light`.
bool _isDark(Brightness brightness) {
  /// return bool
  return brightness == Brightness.dark;
}

/// return new `FloatingActionButtonThemeData` customized by `Color`.
FloatingActionButtonThemeData _getFabThemeData(Color color) {
  /// return FloatingActionButtonThemeData
  return FloatingActionButtonThemeData(foregroundColor: color);
}

/// return new `TextTheme` customized by `Color`.
TextTheme _getTextTheme(Color color) {
  /// set textColorStyle by color.
  final textColor = TextStyle(color: color);

  /// return TextTheme
  return TextTheme(
    bodyText1: textColor,
    bodyText2: textColor,
    button: textColor,
    caption: textColor,
    headline1: textColor,
    headline2: textColor,
    headline3: textColor,
    headline4: textColor,
    headline5: textColor,
    headline6: textColor,
    overline: textColor,
    subtitle1: textColor,
    subtitle2: textColor,
  );
}

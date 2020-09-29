import 'package:easy_theme/classes/myColors.dart';
import 'package:easy_theme/classes/themeData.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  /// The variable that will save the colors
  MyColors _myColors;

  /// The variable that will save the theme
  ThemeData _myTheme;

  /// The main color of your theme
  Color primary;

  /// The accent color of your theme
  Color secondary;

  /// A color for information such as alerts, tutorials, badges, etc...
  Color info;

  /// A color for errors in forms, in actions, in alerts, etc...
  Color error;

  /// A color for warning such as alerts, badges, etc...
  Color warning;

  /// A color to show success after an action, a toturial, in a popup, etc...
  Color success;

  /// Default if `light`;
  Brightness brightness;

  /// Is the main class of the package, it will be responsible for generating a theme for your app and a color variable, which facilitates work and understanding.
  ///
  /// `primary` is the argument that will define the main color of your topic;
  /// `secondary` if no value is passed, it will be calculated based on the `primary`;
  /// `brightness` default if `light`, but you can pass another value to mount dark themes for example;
  CustomTheme({
    @required this.primary,
    this.secondary,
    this.info = Colors.indigo,
    this.error = Colors.red,
    this.warning = Colors.amber,
    this.success = Colors.green,
    this.brightness = Brightness.light,
  }) {
    /// if secondary is null, secondary is equal to primary.
    if (this.secondary.toString() == 'null') {
      this.secondary = this.primary;
    }

    /// create `MyColors` for this custom theme.
    this._createMyColors();

    /// create `ThemeData` for this custom theme.
    this._createMyTheme();
  }

  /// turn a `Color` into `int`.
  int _colorToInt(Color color) {
    return int.parse(color.value.toRadixString(16), radix: 16);
  }

  /// create `MyColors` for this custom theme.
  void _createMyColors() {
    this._myColors = MyColors(
      primary: this._colorToInt(this.primary),
      secondary: this._colorToInt(this.secondary),
      info: this._colorToInt(this.info),
      error: this._colorToInt(this.error),
      warning: this._colorToInt(this.warning),
      success: this._colorToInt(this.success),
      black: this._colorToInt(Colors.black),
      white: this._colorToInt(Colors.white),
    );
  }

  /// create `ThemeData` for this custom theme.
  void _createMyTheme() {
    this._myTheme = createNewTheme(this._myColors, this.brightness);
  }

  /// return `MyColors`.
  MyColors getColors() {
    return this._myColors;
  }

  /// return `ThemeData`.
  ThemeData getTheme() {
    return this._myTheme;
  }
}

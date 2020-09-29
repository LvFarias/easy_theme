library easy_theme;

import 'package:easy_theme/utils/colors.dart';
import 'package:easy_theme/utils/theme.dart';
import 'package:flutter/material.dart';

export 'utils/colors.dart';

class CustomTheme {
  MyColors _myColors;
  ThemeData _myTheme;

  Color primary;
  Color secondary;
  Color info;
  Color error;
  Color warning;
  Color success;
  Brightness brightness;

  CustomTheme({
    @required this.primary,
    this.secondary,
    this.info = Colors.indigo,
    this.error = Colors.red,
    this.warning = Colors.amber,
    this.success = Colors.green,
    this.brightness = Brightness.light,
  }) {
    if (this.secondary.toString() == 'null') {
      this.secondary = this.primary;
    }
    this._createMyColors();
    this._createMyTheme();
  }

  int _colorToInt(Color color) {
    return int.parse(color.value.toRadixString(16), radix: 16);
  }

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

  void _createMyTheme() {
    this._myTheme = createNewTheme(this._myColors, this.brightness);
  }

  MyColors getColors() {
    return this._myColors;
  }

  ThemeData getTheme() {
    return this._myTheme;
  }
}

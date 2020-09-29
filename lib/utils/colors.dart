import 'package:flutter/material.dart';

class MyColors {
  MaterialColor primary;
  MaterialColor secondary;
  MaterialColor info;
  MaterialColor error;
  MaterialColor warning;
  MaterialColor success;
  MaterialColor white;
  MaterialColor black;

  MyColors({
    @required int primary,
    int secondary,
    int info,
    int error,
    int warning,
    int success,
    int white,
    int black,
  }) {
    this.primary = MaterialColor(
      primary,
      this._getMaterialColorValues(Color(primary)),
    );
    this.secondary = MaterialColor(
      secondary,
      this._getMaterialColorValues(Color(secondary)),
    );
    this.success = MaterialColor(
      success,
      this._getMaterialColorValues(Color(success)),
    );
    this.info = MaterialColor(
      info,
      this._getMaterialColorValues(Color(info)),
    );
    this.warning = MaterialColor(
      warning,
      this._getMaterialColorValues(Color(warning)),
    );
    this.error = MaterialColor(
      error,
      this._getMaterialColorValues(Color(error)),
    );
    this.white = MaterialColor(
      white,
      this._getMaterialColorValues(Color(white)),
    );
    this.black = MaterialColor(
      black,
      this._getMaterialColorValues(Color(black)),
    );
  }

  Color _getSwatchShade(Color color, int swatch) {
    final int alpha = (swatch * 255) ~/ 1000;
    return color.withAlpha(alpha);
  }

  Map<int, Color> _getMaterialColorValues(Color color) {
    return <int, Color>{
      50: this._getSwatchShade(color, 50),
      100: this._getSwatchShade(color, 100),
      200: this._getSwatchShade(color, 200),
      300: this._getSwatchShade(color, 300),
      400: this._getSwatchShade(color, 400),
      500: this._getSwatchShade(color, 500),
      600: this._getSwatchShade(color, 600),
      700: this._getSwatchShade(color, 700),
      800: this._getSwatchShade(color, 800),
      900: this._getSwatchShade(color, 900),
    };
  }
}

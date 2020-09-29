import 'package:flutter/material.dart';

class MyColors {
  /// The main color of your theme
  MaterialColor primary;

  /// The accent color of your theme
  MaterialColor secondary;

  /// A color for information such as alerts, tutorials, badges, etc...
  MaterialColor info;

  /// A color for errors in forms, in actions, in alerts, etc...
  MaterialColor error;

  /// A color for warning such as alerts, badges, etc...
  MaterialColor warning;

  /// A color to show success after an action, a toturial, in a popup, etc...
  MaterialColor success;

  /// `white` color, which can be customized to suit the theme, usually used in
  /// backgrounds for `light themes`, or for texts in `dark themes`
  MaterialColor white;

  /// `black` color, which can be customized to suit the theme, usually used in
  /// backgrounds for `dark themes`, or for texts in `light themes`
  MaterialColor black;

  /// Is a class that transforms the `Colors` passed in `CustomTheme` to `MaterialColors`, and puts it in an easy to understand structure to be used in the application.
  ///
  /// `primary` is the only argument that is required;
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
    /// Set `primary value` based on int value passed.
    this.primary = MaterialColor(
      primary,
      this._getMaterialColorValues(Color(primary)),
    );

    /// Set `secondary value` based on int value passed.
    this.secondary = MaterialColor(
      secondary,
      this._getMaterialColorValues(Color(secondary)),
    );

    /// Set `success value` based on int value passed.
    this.success = MaterialColor(
      success,
      this._getMaterialColorValues(Color(success)),
    );

    /// Set `info value` based on int value passed.
    this.info = MaterialColor(
      info,
      this._getMaterialColorValues(Color(info)),
    );

    /// Set `warning value` based on int value passed.
    this.warning = MaterialColor(
      warning,
      this._getMaterialColorValues(Color(warning)),
    );

    /// Set `error value` based on int value passed.
    this.error = MaterialColor(
      error,
      this._getMaterialColorValues(Color(error)),
    );

    /// Set `white value` based on int value passed.
    this.white = MaterialColor(
      white,
      this._getMaterialColorValues(Color(white)),
    );

    /// Set `black value` based on int value passed.
    this.black = MaterialColor(
      black,
      this._getMaterialColorValues(Color(black)),
    );
  }

  /// Get `Shade` to `Color` based on color and swatch 0 - 1000.
  Color _getSwatchShade(Color color, int swatch) {
    final int alpha = (swatch * 255) ~/ 1000;
    return color.withAlpha(alpha);
  }

  /// Build a `MeterialColor` object based on `Color`.
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

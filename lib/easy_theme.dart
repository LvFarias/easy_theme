/// set library name
library easy_theme;

import 'package:flutter/material.dart';

/// import file customTheme from classes
import 'classes/customTheme.dart';

/// import file myColors from classes
import 'classes/myColors.dart';

/// hide CustomTheme class
export 'classes/customTheme.dart' hide CustomTheme;

/// hide MyColors class
export 'classes/myColors.dart' hide MyColors;

/// export EasyColors class
class EasyColors extends MyColors {
  EasyColors({
    @required int primary,
    @required int secondary,
    @required int info,
    @required int error,
    @required int warning,
    @required int success,
    @required int white,
    @required int black,
  }) : super(
          primary: primary,
          secondary: secondary,
          info: info,
          error: error,
          warning: warning,
          success: success,
          white: white,
          black: black,
        );
}

/// export EasyTheme class
class EasyTheme extends CustomTheme {
  EasyTheme({
    @required Color primary,
    Color secondary,
    Color info,
    Color error,
    Color warning,
    Color success,
    Brightness brightness,
  }) : super(
          primary: primary,
          secondary: secondary,
          info: info,
          error: error,
          warning: warning,
          success: success,
          brightness: brightness,
        );
}

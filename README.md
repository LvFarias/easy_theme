# Easy Theme

![Language](https://img.shields.io/static/v1?label&message=Dart&logo=dart&color=0175C2&logoColor=FFF) ![Framework](https://img.shields.io/static/v1?label&message=Flutter&logo=flutter&color=02569B&logoColor=FFF) ![Version](https://img.shields.io/badge/Version-v1.0.0-0abab5) ![License](https://img.shields.io/badge/License-MIT-ba9f1c) ![Tests](https://img.shields.io/badge/PubDev%20Points-110-8a05be) ![Tests](https://img.shields.io/badge/Tests-Passed-25a108) ![Last Commit](https://img.shields.io/badge/Last%20Commit-29/09/20-10569c)

## Sumary

- [Description](#description)
- [Installation](#installation)
  - [Depend on it](#depend-on-it)
  - [Install it](#install-it)
  - [Import it](#import-it)
- [What is CustomTheme](#what-is-customtheme)
  - [MyColors](#mycolors)
- [Customize](#customize)
- [Exemple](#exemple)
- [Authors](#authors)

## Description

A package to generate MaterialColors and a ThemeData for your Flutter App in an __EASY__ and __FAST WAY__.

## Installation
### Depend on it
Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  easy_theme: ^0.1.0
```

### Install it
You can install packages from the command line:

with Flutter:
```bash
flutter pub get
```

Alternatively, your editor might support flutter pub get. Check the docs for your editor to learn more.

### Import it
Now in your Dart code, you can use:

```dart
import 'package:easy_theme/easy_theme.dart';
```

### Use it
Now in your Dart code, you can use:

```dart
final EasyTheme myCustomTheme = EasyTheme(primary: Colors.blue);
```

## What is CustomTheme?
Is the main class of the package, it will be responsible for generating a theme for your app and a color variable, which facilitates work and understanding.

When instantiation the class, it is mandatory to pass a primary color as a parameter, but it is also possible to pass the colors: secondary, success, info, warning, error.
It is also possible to pass a brightness to build dark or light themes.

This class there are two public functions, they are:
- __getColors__ that returns an object of type [MyColors](#mycolors)
- __getTheme__ that returns an object of type [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)

### MyColors

Is a class that transforms the colors passed in CustomTheme to MaterialColors, and puts it in an easy to understand structure to be used in the application.

It contains the following MaterialColors:
primary; secondary; success; info; warning; error; white; black;

White is #FFFFFF and Black is #000000.

Secondary, if not provided at CustomTheme instantiation, a complementary color to the primary calculated by the MyColors class.

## Customize
Try to pass more colors to CustomTheme for a more personalized theme.

```dart
final CustomTheme myCustomTheme = CustomTheme(
    primary: Color(0XFF0F4C81),
    secondary: Color(0XFFCFA904),
    success: : Color(0XFF268209),
    info: : Color(0XFF09827A),
    warning: : Color(0XFFB49404),
    error: : Color(0XFF82211D),
    brightness: Brightness.light,
);
```

You can also create more than one theme for your application, as in the example below a dark and light theme is created

```dart
final CustomTheme myCustomThemeLight = CustomTheme(
    primary: Color(0XFF0F4C81),
    secondary: Color(0XFFCFA904),
    success: : Color(0XFF268209),
    info: : Color(0XFF09827A),
    warning: : Color(0XFFB49404),
    error: : Color(0XFF82211D),
    brightness: Brightness.light,
);

final CustomTheme myCustomThemeDark = CustomTheme(
    primary: Color(0XFFCFA904),
    secondary: Color(0XFF007FB1),
    success: : Color(0XFF5AB009),
    info: : Color(0XFF1283B0),
    warning: : Color(0XFFFCC319),
    error: : Color(0XFFB03009),
    brightness: Brightness.dark,
);
```

## Authors

- [Luan Vasco de Farias](https://github.com/LvFarias)

## Exemple

```dart
////////// IMPORT EASY THEME //////////
import 'package:easy_theme/easy_theme.dart';

/// Creating a Easy Theme based on the blue color (`Colors.blue`)
final EasyTheme myCustomTheme = EasyTheme(primary: Colors.blue);

/// get the ThemeData object created by the EasyTheme
final ThemeData myTheme = myCustomTheme.getTheme();

/// get the EasyColors object created by the EasyTheme
final EasyColors myColors = myCustomTheme.getColors();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theme Test',
      /// use `myTheme` in your
      theme: myTheme,
      home: MyHomePage(),
    );
  }
}
```
import 'package:easy_theme/easy_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final customTheme = CustomTheme(primary: Colors.blue);
  test('crate CustomTheme class', () {
    expect(
      customTheme.toString(),
      CustomTheme(primary: Colors.blue).toString(),
    );
  });
  test('get my custom colors', () {
    expect(
      customTheme.getColors().primary.toString(),
      Colors.blue.toString(),
    );
  });
  test('get my custom theme', () {
    expect(
      customTheme.getTheme().primaryColor.toString(),
      customTheme.getColors().primary.toString(),
    );
  });
}

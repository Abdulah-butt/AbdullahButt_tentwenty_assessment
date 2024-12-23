import 'package:flutter/material.dart';

extension ThemeExtension on BuildContext {
  ColorScheme get colorTheme => Theme.of(this).colorScheme;
  ThemeData get themeData => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  double get statusBarHeight => MediaQuery.paddingOf(this).top;

  /// screen width
  double get sw => MediaQuery.sizeOf(this).width;

  /// screen height
  double get sh => MediaQuery.sizeOf(this).height;
}

import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';

typedef ThemeDataDelegate = UnaryDelegate<ThemeData, ThemeData>;

class DefaultThemeDataDelegate extends ThemeDataDelegate {
  const DefaultThemeDataDelegate();
  @override
  ThemeData call(p0) => p0;
}

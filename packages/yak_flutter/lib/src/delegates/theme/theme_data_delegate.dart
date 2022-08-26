import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';

/// A convinence typedef for [UnaryDelegate<ThemeData, ThemeData>]
typedef ThemeDataDelegate = UnaryDelegate<ThemeData, ThemeData>;

/// A default implementation for [ThemeDataDelegate]
///
/// it returns the same [ThemeData] that has been provided
class DefaultThemeDataDelegate extends ThemeDataDelegate {
  const DefaultThemeDataDelegate();
  @override
  ThemeData call(p0) => p0;
}

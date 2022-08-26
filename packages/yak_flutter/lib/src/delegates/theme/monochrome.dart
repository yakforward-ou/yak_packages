import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_tween/yak_tween.dart';

import 'theme_data_delegate.dart';

/// A [ThemeDataDelegate] sets the [ColorScheme] and [TextTheme] of [ThemeData]
///
/// ... to a single [background] and [foreground] color palette
class MonochromeThemeDelegate extends ThemeDataDelegate {
  final Color background;
  final Color foreground;
  final Color shadow;
  final Color error;
  final Color? onError;
  final double foregroundOnBackgroundRatio;
  final double luminanceThreshold;

  /// [MonochromeThemeDelegate] allows a constant constructor
  const MonochromeThemeDelegate({
    required this.background,
    required this.foreground,
    required this.shadow,
    required this.error,
    this.onError,
    this.foregroundOnBackgroundRatio = .1,
    this.luminanceThreshold = .5,
  });

  /// calculate the luminance of the theme
  ///
  /// defaults a to a `90%` background color
  double get luminance => YakColorTween(begin: background, end: foreground)
      .lerp(foregroundOnBackgroundRatio)
      .computeLuminance();

  /// compatible with `jsonEncode`
  Json toJson() => {
        'background': background.value,
        'foreground': foreground.value,
        'foregroundOnBackgroundRatio': foregroundOnBackgroundRatio,
        'luminanceThreshold': luminanceThreshold,
        'luminance': luminance,
        'neutral': shadow.value,
        'error': error.value,
      };

  @override
  String toString() => '${toJson()}';

  @override
  bool operator ==(Object other) =>
      other is MonochromeThemeDelegate && other.hashCode == hashCode;

  @override
  int get hashCode => Object.hashAll([
        background,
        foreground,
        foregroundOnBackgroundRatio,
        shadow,
        error,
        onError,
        luminance,
        luminanceThreshold,
      ]);

  /// applies the changes to the provided [ThemeData]
  @override
  ThemeData call(p0) => p0.copyWith(
        textTheme: p0.textTheme.copyWith(
          displayLarge: p0.textTheme.displayLarge?.copyWith(
            color: foreground,
          ),
          displayMedium: p0.textTheme.displayMedium?.copyWith(
            color: foreground,
          ),
          displaySmall: p0.textTheme.displaySmall?.copyWith(
            color: foreground,
          ),
          headlineMedium: p0.textTheme.headlineMedium?.copyWith(
            color: foreground,
          ),
          headlineSmall: p0.textTheme.headlineSmall?.copyWith(
            color: foreground,
          ),
          titleLarge: p0.textTheme.titleLarge?.copyWith(
            color: foreground,
          ),
          titleMedium: p0.textTheme.titleMedium?.copyWith(
            color: foreground,
          ),
          titleSmall: p0.textTheme.titleSmall?.copyWith(
            color: foreground,
          ),
          bodyLarge: p0.textTheme.bodyLarge?.copyWith(
            color: foreground,
          ),
          bodyMedium: p0.textTheme.bodyMedium?.copyWith(
            color: foreground,
          ),
          bodySmall: p0.textTheme.bodySmall?.copyWith(
            color: foreground,
          ),
          labelLarge: p0.textTheme.labelLarge?.copyWith(
            color: foreground,
          ),
          labelSmall: p0.textTheme.labelSmall?.copyWith(
            color: foreground,
          ),
        ),
        colorScheme: ColorScheme(
          background: background,
          brightness: luminance < luminanceThreshold
              ? Brightness.dark
              : Brightness.light,
          error: error,
          onBackground: foreground,
          onError: onError ?? foreground,
          onPrimary: foreground,
          onSecondary: foreground,
          onSurface: foreground,
          primary: background,
          secondary: background,
          surface: background,
        ),
      );
}

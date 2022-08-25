import 'package:flutter/material.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_tween/yak_tween.dart';

import 'theme_data_delegate.dart';

/// a [ThemeDataDelegate] that set [ColorScheme] and [TextTheme] color
/// to a single [background] and [foreground] color palette
class MonochromeThemeDelegate extends ThemeDataDelegate {
  final Color background;
  final Color foreground;
  final Color shadow;
  final Color error;
  final Color? onError;

  final double foregroundOnBackgroundRatio;
  final double luminanceThreshold;
  const MonochromeThemeDelegate({
    required this.background,
    required this.foreground,
    required this.shadow,
    required this.error,
    this.onError,
    this.foregroundOnBackgroundRatio = .1,
    this.luminanceThreshold = .5,
  });

  double get luminance => YakColorTween(begin: background, end: foreground)
      .lerp(foregroundOnBackgroundRatio)
      .computeLuminance();

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

  @override
  ThemeData call(p0) => p0.copyWith(
        textTheme: p0.textTheme.copyWith(
          headline1: p0.textTheme.headline1?.copyWith(
            color: foreground,
          ),
          headline2: p0.textTheme.headline2?.copyWith(
            color: foreground,
          ),
          headline3: p0.textTheme.headline3?.copyWith(
            color: foreground,
          ),
          headline4: p0.textTheme.headline4?.copyWith(
            color: foreground,
          ),
          headline5: p0.textTheme.headline5?.copyWith(
            color: foreground,
          ),
          headline6: p0.textTheme.headline6?.copyWith(
            color: foreground,
          ),
          subtitle1: p0.textTheme.subtitle1?.copyWith(
            color: foreground,
          ),
          subtitle2: p0.textTheme.subtitle2?.copyWith(
            color: foreground,
          ),
          bodyText1: p0.textTheme.bodyText1?.copyWith(
            color: foreground,
          ),
          bodyText2: p0.textTheme.bodyText2?.copyWith(
            color: foreground,
          ),
          caption: p0.textTheme.caption?.copyWith(
            color: foreground,
          ),
          button: p0.textTheme.button?.copyWith(
            color: foreground,
          ),
          overline: p0.textTheme.overline?.copyWith(
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

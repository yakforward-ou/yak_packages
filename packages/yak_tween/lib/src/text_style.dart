import 'dart:ui' as ui show lerpDouble;
import 'package:flutter/material.dart';
import '../yak_tween.dart';

/// an `TextStyleTween` that allows `const` constructor
class YakTextStyleTween extends YakTween<TextStyle> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakTextStyleTween({required super.begin, required super.end});

  @override
  TextStyle lerp(double t) => TextStyle(
        inherit: end.inherit,
        color: begin.foreground == null && end.foreground == null
            ? Color.lerp(begin.color, end.color, t)
            : null,
        backgroundColor: begin.background == null && end.background == null
            ? Color.lerp(begin.backgroundColor, end.backgroundColor, t)
            : null,
        fontFamily: t < 0.5 ? begin.fontFamily : end.fontFamily,
        fontFamilyFallback:
            t < 0.5 ? begin.fontFamilyFallback : end.fontFamilyFallback,
        fontSize: ui.lerpDouble(
            begin.fontSize ?? end.fontSize, end.fontSize ?? begin.fontSize, t),
        fontWeight: FontWeight.lerp(begin.fontWeight, end.fontWeight, t),
        fontStyle: t < 0.5 ? begin.fontStyle : end.fontStyle,
        letterSpacing: ui.lerpDouble(begin.letterSpacing ?? end.letterSpacing,
            end.letterSpacing ?? begin.letterSpacing, t),
        wordSpacing: ui.lerpDouble(begin.wordSpacing ?? end.wordSpacing,
            end.wordSpacing ?? begin.wordSpacing, t),
        textBaseline: t < 0.5 ? begin.textBaseline : end.textBaseline,
        height: ui.lerpDouble(
            begin.height ?? end.height, end.height ?? begin.height, t),
        locale: t < 0.5 ? begin.locale : end.locale,
        foreground: (begin.foreground != null || end.foreground != null)
            ? t < 0.5
                ? begin.foreground ?? (Paint()..color = begin.color!)
                : end.foreground ?? (Paint()..color = end.color!)
            : null,
        background: (begin.background != null || end.background != null)
            ? t < 0.5
                ? begin.background ?? (Paint()..color = begin.backgroundColor!)
                : end.background ?? (Paint()..color = end.backgroundColor!)
            : null,
        shadows: t < 0.5 ? begin.shadows : end.shadows,
        fontFeatures: t < 0.5 ? begin.fontFeatures : end.fontFeatures,
        decoration: t < 0.5 ? begin.decoration : end.decoration,
        decorationColor:
            Color.lerp(begin.decorationColor, end.decorationColor, t),
        decorationStyle: t < 0.5 ? begin.decorationStyle : end.decorationStyle,
        decorationThickness: ui.lerpDouble(
            begin.decorationThickness ?? end.decorationThickness,
            end.decorationThickness ?? begin.decorationThickness,
            t),
        //!
        /// debugLabel as `_kDefaultDebugLabel` from `text_style.dart`
        debugLabel: 'unknown',
      );
}

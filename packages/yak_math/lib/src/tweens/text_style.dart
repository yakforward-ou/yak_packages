import 'package:flutter/material.dart';
import 'tween.dart';

/// an `TextStyleTween` that allows `const` constructor

class YakTextStyleTween extends YakTween<TextStyle> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakTextStyleTween({
    TextStyle begin,
    TextStyle end,
  })
  // coverage:ignore-line to ignore one line.

  : super(
          begin: begin,
          end: end,
        );
  @override
  TextStyle lerp(double t) => TextStyle.lerp(begin, end, t);
}

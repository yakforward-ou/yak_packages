import 'dart:ui';
import 'tween.dart';

/// an `ColorTween` that allows `const` constructor

class YakColorTween extends YakTween<Color> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakColorTween({
    Color begin,
    Color end,
  }) : super(
          begin: begin,
          end: end,
        );
  @override
  Color lerp(double t) => Color.lerp(begin, end, t);
}

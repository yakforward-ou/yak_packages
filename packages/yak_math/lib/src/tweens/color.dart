import 'dart:ui';
import '../../yak_math.dart';
import 'tween.dart';

/// an `ColorTween` that allows `const` constructor

class YakColorTween extends YakTween<Color> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakColorTween({
    required Color begin,
    required Color end,
  })
  // coverage:ignore-line
  : super(
          begin: begin,
          end: end,
        );
  @override
  Color lerp(double t) => Color.fromARGB(
        clampInt(lerpInt(begin.alpha, end.alpha, t).toInt(), 0, 255),
        clampInt(lerpInt(begin.red, end.red, t).toInt(), 0, 255),
        clampInt(lerpInt(begin.green, end.green, t).toInt(), 0, 255),
        clampInt(lerpInt(begin.blue, end.blue, t).toInt(), 0, 255),
      );
}

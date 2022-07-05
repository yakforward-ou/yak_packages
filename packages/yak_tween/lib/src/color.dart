import 'dart:ui';

import 'package:yak_utils/yak_utils.dart';

import '../yak_tween.dart';

const _colorMin = 0;
const _colorMax = 255;

/// an `ColorTween` that allows `const` constructor
class YakColorTween extends YakTween<Color> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakColorTween({required super.begin, required super.end});

  @override
  Color lerp(double t) => Color.fromARGB(
        clampInt(
          lerpInt(begin.alpha, end.alpha, t).toInt(),
          _colorMin,
          _colorMax,
        ),
        clampInt(
          lerpInt(begin.red, end.red, t).toInt(),
          _colorMin,
          _colorMax,
        ),
        clampInt(
          lerpInt(begin.green, end.green, t).toInt(),
          _colorMin,
          _colorMax,
        ),
        clampInt(
          lerpInt(begin.blue, end.blue, t).toInt(),
          _colorMin,
          _colorMax,
        ),
      );
}

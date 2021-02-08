import 'package:flutter/painting.dart';
import 'tween.dart';

/// an `BorderTwee` that allows `const` constructor

class YakBorderTween extends YakTween<Border> {
  const YakBorderTween({
    Border begin,
    Border end,
  }) : super(begin: begin, end: end);
  @override
  Border lerp(double t) => Border.lerp(begin, end, t);
}

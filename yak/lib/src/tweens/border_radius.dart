import 'package:flutter/painting.dart';
import 'tween.dart';

class YakBorderRadiusTween extends YakTween<BorderRadius> {
  const YakBorderRadiusTween({
    BorderRadius begin,
    BorderRadius end,
  }) : super(begin: begin, end: end);
  @override
  BorderRadius lerp(double t) => BorderRadius.lerp(begin, end, t);
}

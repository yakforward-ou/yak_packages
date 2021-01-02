import 'package:flutter/painting.dart';
import 'tween.dart';

class YakFractionalOffsetTween extends YakTween<FractionalOffset> {
  const YakFractionalOffsetTween({
    FractionalOffset begin,
    FractionalOffset end,
  }) : super(begin: begin, end: end);
  @override
  FractionalOffset lerp(double t) => FractionalOffset.lerp(begin, end, t);
}

import 'package:flutter/rendering.dart';
import 'tween.dart';

/// an `BoxConstraintsTween` that allows `const` constructor

class YakBoxConstraintsTween extends YakTween<BoxConstraints> {
  const YakBoxConstraintsTween({
    BoxConstraints begin,
    BoxConstraints end,
  }) : super(begin: begin, end: end);
  @override
  BoxConstraints lerp(double t) => BoxConstraints.lerp(begin, end, t);
}

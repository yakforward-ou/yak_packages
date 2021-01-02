import 'package:flutter/painting.dart';
import 'tween.dart';

class YakAlignmentGeometryTween extends YakTween<AlignmentGeometry> {
  const YakAlignmentGeometryTween({
    AlignmentGeometry begin,
    AlignmentGeometry end,
  }) : super(begin: begin, end: end);
  @override
  AlignmentGeometry lerp(double t) => AlignmentGeometry.lerp(begin, end, t);
}

import 'package:flutter/painting.dart';
import 'tween.dart';

class YakEdgeInsetsTween extends YakTween<EdgeInsets> {
  const YakEdgeInsetsTween({
    EdgeInsets begin,
    EdgeInsets end,
  }) : super(begin: begin, end: end);
  @override
  EdgeInsets lerp(double t) => EdgeInsets.lerp(begin, end, t);
}

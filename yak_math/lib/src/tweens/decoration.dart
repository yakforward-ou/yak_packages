import 'package:flutter/painting.dart';
import 'tween.dart';

class YakDecorationTween extends YakTween<Decoration> {
  const YakDecorationTween({
    Decoration begin,
    Decoration end,
  }) : super(begin: begin, end: end);
  @override
  Decoration lerp(double t) => Decoration.lerp(begin, end, t);
}

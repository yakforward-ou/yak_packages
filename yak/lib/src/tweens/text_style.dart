import 'package:flutter/material.dart';
import 'tween.dart';

class YakTextStyleTween extends YakTween<TextStyle> {
  const YakTextStyleTween({
    TextStyle begin,
    TextStyle end,
  }) : super(begin: begin, end: end);
  @override
  TextStyle lerp(double t) => TextStyle.lerp(begin, end, t);
}

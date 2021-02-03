import 'dart:ui';
import 'tween.dart';

class YakRectTween extends YakTween<Rect> {
  const YakRectTween({Rect begin, Rect end}) : super(begin: begin, end: end);
  @override
  Rect lerp(double t) => Rect.lerp(begin, end, t);
}
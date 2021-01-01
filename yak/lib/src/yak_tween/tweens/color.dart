import 'dart:ui';
import 'tween.dart';

class YakColorTween extends YakTween<Color> {
  const YakColorTween({Color begin, Color end}) : super(begin: begin, end: end);
  @override
  Color lerp(double t) => Color.lerp(begin, end, t);
}

class YakSizeTween extends YakTween<Size> {
  const YakSizeTween({
    Size begin,
    Size end,
  }) : super(begin: begin, end: end);
  @override
  Size lerp(double t) => Size.lerp(begin, end, t);
}

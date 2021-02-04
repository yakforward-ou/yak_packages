import 'dart:ui';
import 'tween.dart';

/// an `SizeTween` that allows `const` constructor

class YakSizeTween extends YakTween<Size> {
  const YakSizeTween({
    Size begin,
    Size end,
  }) : super(begin: begin, end: end);
  @override
  Size lerp(double t) => Size.lerp(begin, end, t);
}

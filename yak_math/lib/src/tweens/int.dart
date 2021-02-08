import 'tween.dart';

/// an `IntTween` that allows `const` constructor

class YakIntTween extends YakTween<int> {
  const YakIntTween({
    int begin,
    int end,
  }) : super(begin: begin, end: end);
  @override
  int lerp(double t) => (begin + (end - begin) * t).round();
}

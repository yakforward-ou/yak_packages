import 'tween.dart';

/// an `IntTween` that allows `const` constructor
class YakIntTween extends YakTween<int> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakIntTween({
    required int begin,
    required int end,
  }) : super(begin: begin, end: end); // coverage:ignore-line

  @override
  int lerp(double t) => (begin + (end - begin) * t).round();
}

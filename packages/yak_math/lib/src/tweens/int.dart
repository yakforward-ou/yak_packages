import 'tween.dart';

/// an `IntTween` that allows `const` constructor
class YakIntTween extends YakTween<int> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakIntTween({
    int begin,
    int end,
  })
  // coverage:ignore-line
  : super(
          begin: begin,
          end: end,
        );
  @override
  int lerp(double t) => (begin + (end - begin) * t).round();
}

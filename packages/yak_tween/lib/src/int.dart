import '../yak_tween.dart';

/// an `IntTween` that allows `const` constructor
class YakIntTween extends YakTween<int> {
  /// like most `Tween`s has parameters `begin` and `end`
  const YakIntTween({required super.begin, required super.end});

  @override
  int lerp(double t) => (begin + (end - begin) * t).round();
}

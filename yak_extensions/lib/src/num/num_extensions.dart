extension YakNumExtensions on num {
  /// [smallest] return the smaller num between [this] and the [argument]
  num smallest(num x) => this < x ? this : x;

  /// [biggest] return the bigger num between [this] and the [argument]
  num biggest(num x) => this > x ? this : x;

  /// [cap] limits the num to the lower or higher bounds provided as argumet
  num cap(num a, num b) {
    assert(a != b, 'a and b must be different');
    final num _s = a.smallest(b);
    final num _b = a.biggest(b);
    return this > _b ? _b : (this < _s ? _s : this);
  }

  /// [capFromAbs] limits the num to the lower or higher bounds
  /// of the positve of negative values of a provided natural number
  ///
  num capFromAbs(num x) {
    assert(x > 0, 'x must be positive');
    return this > x ? x : (this < -x ? -x : this);
  }

  /// [reverseLerp] provide the value [t] that passed into [lerp]
  ///  (https://api.flutter.dev/flutter/dart-ui/Offset/lerp.html)
  /// together with [a] and [b] return the value [this]

  double reverseLerp(num a, num b) {
    assert(a != b, '"a" and "b" must not be identical');
    final num _s = a.smallest(b);
    final num _b = a.biggest(b);
    assert(this >= _s && this <= _b, 'the value is not in range');
    return (this - _s) / (_b - _s);
  }
}

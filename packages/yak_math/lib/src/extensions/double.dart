import 'dart:math';

/// round a double to with a precision of given `n` digits
extension RoundToPrecisionX on double {
  /// round a double to with a precision of given `n` digit
  double roundToPrecision(int n) {
    final f = pow(10, n);
    return (this * f).round() / f;
  }
}

import '../../../src/all.dart';

/// builds on top of `MoreOrLessEqualsNumX` to allow nullable
extension MoreOrLessEqualsMaybeIntX on num? {
  /// returns a `bool` representing the extended double being  equal to `d`
  bool moreOrLessEquals(
    num d, {
    double epsilon = precisionErrorTolerance,
  }) =>
      this == null ? false : this!.moreOrLessEquals(d, epsilon: epsilon);
}

/// mirrors `flutte_test` matcher `MoreOrLessEquals` (but typesafe)
extension MoreOrLessEqualsNumX on num {
  /// returns a `bool` representing the extended double being  equal to `d`
  bool moreOrLessEquals(
    num d, {
    double epsilon = precisionErrorTolerance,
  }) =>
      this == d
          ? true
          : (this - d).abs() <= epsilon
              ? true
              : false;
}

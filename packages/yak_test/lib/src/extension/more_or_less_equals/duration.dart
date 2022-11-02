import '../../../src/all.dart';

/// mirrors `flutte_test` matcher `MoreOrLessEquals` (but typesafe)
extension MoreOrLessEqualsDurationX on Duration? {
  /// returns a `bool` representing the extended double being  equal to `d`
  bool moreOrLessEquals(
    Duration d, {
    double epsilon = precisionErrorTolerance,
  }) =>
      this == null
          ? false
          : this!
              .inMicroseconds
              .moreOrLessEquals(d.inMicroseconds, epsilon: epsilon);
}

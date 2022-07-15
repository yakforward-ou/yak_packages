import 'package:yak_utils/yak_utils.dart' show Unary, Nullary;

import 'counter.dart';
import 'nullary.dart';
import 'unary.dart';

/// an interface for a stubbed method
abstract class Stub<Z> extends Counter {
  /// set the stubbed method
  set stub(Z stub);

  static UnaryStub<T, S, Unary<T, S>> unary<T, S>() =>
      UnaryStub<T, S, Unary<T, S>>();

  static NullaryStub<T, Nullary<T>> nullary<T>() =>
      NullaryStub<T, Nullary<T>>();
}

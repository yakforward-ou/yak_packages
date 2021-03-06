/// identical to `AssertionError`
class WrongErrorHandler<T extends Error> extends Error {
  /// Message describing the avow error.
  final Error actual;
  final Type expected;

  /// Creates an avow error with the provided [message].
  WrongErrorHandler(this.actual) : expected = T;

  String toString() => 'ErrorHandler failed as'
      'an Error of type ${actual.runtimeType} in place of $expected';
}

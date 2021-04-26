/// identical to `AssertionError`
class AvowError extends Error {
  /// Message describing the avow error.
  final Object? message;

  /// Creates an avow error with the provided [message].
  AvowError([this.message]);

  String toString() => message != null
      ? 'Avow Error: ${Error.safeToString(message)}'
      : 'Avow Error';
}

/// identical to `TypeError` but more informative
class AsTypeError extends Error {
  /// Message describing the avow error.
  final Object? message;

  /// Creates an avow error with the provided [message].
  AsTypeError([this.message]);

  String toString() => message != null
      ? 'AsType failed: ${Error.safeToString(message)}'
      : 'AsType failed';
}

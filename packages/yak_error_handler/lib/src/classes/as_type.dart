/// identical to `TypeError` but more informative
class AsTypeError<T, S> extends Error {
  String toString() {
    return 'AsTypeError: $S cannot be casted as $T';
  }
}

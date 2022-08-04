/// an extension on  nullable `Iterable<T>`
extension EmptyOnNullX<T> on Iterable<T>? {
  /// if the `Iterable<T>?` is `null` returns an empty one
  /// useful with `...` operator and such
  Iterable<T> get emptyOnNull => this != null ? this! : {};
}

/// an extension `Iterable<T>`
extension IterableEqualityX<T, S extends Iterable<T>> on S {
  /// does what you expect from `==`
  /// if the iterables are identical will return true
  /// else false
  bool equals(S other) {
    if (length != other.length) {
      return false;
    }
    for (var i = 0; i < length; ++i) {
      if (other.elementAt(i) != elementAt(i)) {
        return false;
      }
    }
    return true;
  }
}

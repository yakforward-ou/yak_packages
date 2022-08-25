/// an extension on  nullable `Iterable<T>`
extension EmptyOnNullX<T> on Iterable<T>? {
  /// if the `Iterable<T>?` is `null` returns an empty one
  /// useful with `...` operator and such
  Iterable<T> get emptyOnNull => this != null ? this! : {};
}

/// an extension `List<T>`
extension ListEqualityX<T, S extends List<T>> on S {
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

/// an extension `List<T>`
extension SetEqualityX<T, S extends Set<T>> on S {
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

/// an extension `Map<T, S>`
extension MapEqualityX<T, S, M extends Map<T, S>> on M {
  /// does what you expect from `==`
  /// if the iterables are identical will return true
  /// else false
  bool equals(M other) {
    if (length != other.length) {
      return false;
    }
    for (final entry in entries) {
      if (!other.containsKey(entry.key)) {
        return false;
      }
      if (other[entry.key] != entry.value) {
        return false;
      }
    }
    return true;
  }
}

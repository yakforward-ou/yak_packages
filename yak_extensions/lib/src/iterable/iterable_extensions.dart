extension YakIterableExtensionsWithType<T> on Iterable<T> {
  Type get valueType => T;

  List<T> get distinct {
    assert(T != Object, 'type T cannot be an Object');
    return Set<T>.of(this).toList();
  }

  bool get isDistinct {
    assert(T != Object, 'type T cannot be an Object');
    return this.distinct.length == this.length;
  }
}

extension YakIterableOfNumExtension on Iterable<num> {
  List<num> get crescent {
    List<num> _l = this.toList()..sort((num a, num b) => a.compareTo(b));
    return _l;
  }
}

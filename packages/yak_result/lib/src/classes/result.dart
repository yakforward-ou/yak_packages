/// represent the outcome of a functionf
abstract class Result<T> {
  /// allows a const constructor
  const Result();

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() => '$runtimeType';
}

import '../all.dart';

/// represent a success of a function
class Success<T> implements Result<T> {
  /// has a const constructor
  const Success(this.data);

  /// hold the data from a function
  final T data;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() => '$runtimeType: $data';
}

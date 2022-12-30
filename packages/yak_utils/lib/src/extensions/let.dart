import '../types/all.dart';

/// an extension on an object that uses it in a given unary
extension LetX<T> on T {
  S let<S>(Unary<S, T> function) => function(this);
}

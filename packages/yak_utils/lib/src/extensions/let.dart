import '../types/all.dart';

/// an extension on an object that uses it in a given unary
extension LetX<T, S> on T {
  S let(Unary<S, T> function) => function(this);
}

import '../types/all.dart';

/// an extension that allow to concatenate functions
///
/// ```dart
/// final result = begin.let(foo).let(bar).let(baz);
/// ```
extension ThenSyncX<T, S> on S {
  T then<R extends Unary<T, S>>(R function) => function(this);
}

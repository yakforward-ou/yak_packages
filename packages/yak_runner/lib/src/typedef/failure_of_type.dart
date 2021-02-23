import '../classes/all.dart';

/// a tupedef for a function that `cast` a failure for a given type
typedef FailureOfType<T> = Failure<T> Function(Object e, StackTrace s);

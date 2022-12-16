import 'dart:async' show FutureOr;

/// a typedef for a "unary" [Function]
typedef Unary<T, S> = T Function(S);
typedef UnaryAsync<T, S> = Unary<Future<T>, S>;
typedef UnaryFutureOr<T, S> = Unary<FutureOr<T>, S>;

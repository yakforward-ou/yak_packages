import 'dart:async' show FutureOr;

/// a typedef for a "nullary" [Function]
typedef Nullary<T> = T Function();

typedef NullaryAsync<T> = Nullary<Future<T>>;

typedef NullaryFutureOr<T> = Nullary<FutureOr<T>>;

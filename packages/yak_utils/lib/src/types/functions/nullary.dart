/// a typedef for a "nullary" [Function]
typedef Nullary<T> = T Function();

/// a typedef for an async "nullary" [Function]
typedef NullaryAsync<T> = Nullary<Future<T>>;

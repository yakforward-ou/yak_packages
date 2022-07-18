/// a typedef for a "multi-argument" [Function]
typedef MultiArgFunction2<T, S, U> = T Function(S, U);

/// a typedef for an async  "multi-argument"  [Function]
typedef MultiArgFunctionAsync2<T, S, U> = MultiArgFunction2<Future<T>, S, U>;

/// a typedef for a "multi-argument" [Function]
typedef MultiArgFunction3<T, S, U, V> = T Function(S, U, V);

/// a typedef for an async  "multi-argument"  [Function]
typedef MultiArgFunctionAsync3<T, S, U, V>
    = MultiArgFunction3<Future<T>, S, U, V>;

/// a typedef for a "multi-argument" [Function]
typedef MultiArgFunction4<T, S, U, V, W> = T Function(S, U, V, W);

/// a typedef for an async  "multi-argument"  [Function]
typedef MultiArgFunctionAsync4<T, S, U, V, W>
    = MultiArgFunction4<Future<T>, S, U, V, W>;

/// a typedef for a "multi-argument" [Function]
typedef MultiArgFunction5<T, S, U, V, W, X> = T Function(S, U, V, W, X);

/// a typedef for an async  "multi-argument"  [Function]
typedef MultiArgFunctionAsync5<T, S, U, V, W, X>
    = MultiArgFunction5<Future<T>, S, U, V, W, X>;

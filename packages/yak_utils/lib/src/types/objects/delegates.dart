import '../../delegates/all.dart';

/// a typedef for an async [NullaryDelegate]
typedef NullaryDelegateAsync<T> = NullaryDelegate<Future<T>>;

/// a typedef for an async [UnaryDelegate]
typedef UnaryDelegateAsync<T, S> = UnaryDelegate<Future<T>, S>;

/// a typedef for an async [MultiDelegate2]
typedef MultiDelegateAsync2<T, S, U> = MultiDelegate2<Future<T>, S, U>;

/// a typedef for an async [MultiDelegate3]
typedef MultiDelegateAsync3<T, S, U, V> = MultiDelegate3<Future<T>, S, U, V>;

/// a typedef for an async [MultiDelegate4]
typedef MultiDelegateAsync4<T, S, U, V, W>
    = MultiDelegate4<Future<T>, S, U, V, W>;

/// a typedef for an async [MultiDelegate5]
typedef MultiDelegateAsync5<T, S, U, V, W, X>
    = MultiDelegate5<Future<T>, S, U, V, W, X>;

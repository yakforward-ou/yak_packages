import '../../delegates/all.dart';

/// a typedef for an async [NullaryDelegate]
typedef NullaryDelegateAsync<T> = NullaryDelegate<Future<T>>;

/// a typedef for an async [UnaryDelegate]
typedef UnaryDelegateAsync<T, S> = UnaryDelegate<Future<T>, S>;

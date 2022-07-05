import '../all.dart';

typedef Nullary<T> = T Function();

typedef NullaryAsync<T> = Future<T> Function();

typedef RunNullarySync<T> = Nullary<Result<T>>;

typedef RunNullaryAsync<T> = NullaryAsync<Result<T>>;

import '../tools/all.dart';
import '../types/all.dart';

/// generates a [Cache] from a [Nullary]
extension CacheNullaryX<T> on Nullary<T> {
  Cache<T> get cache => Cache.sync(this);
}

/// generates a [Cache] from a [NullaryAsync]
extension CacheNullaryAsyncX<T> on NullaryAsync<T> {
  Cache<T> get cache => Cache(this);
}

/// given an argument generates a [Cache] from a [Unary]
extension CacheUnaryX<T, S> on Unary<T, S> {
  Cache<T> cache(S arg) => Cache.sync(() => call(arg));
}

/// given an argument generates a [Cache] from a [UnaryAsync]
extension CacheUnaryAsyncX<T, S> on UnaryAsync<T, S> {
  Cache<T> cache(S arg) => Cache(() => call(arg));
}

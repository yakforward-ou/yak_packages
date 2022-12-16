import 'dart:async' show FutureOr;

import '../../all.dart';

/// a typedef for an [Unary] that returns a `void`
typedef UnaryVoid<T> = Unary<void, T>;

/// a typedef for an [UnaryDelegate] that returns a `void`
typedef UnaryVoidDelegate<T> = UnaryDelegate<void, T>;

/// a typedef for an [Nullary] that returns a `void`
typedef NullaryVoid = Nullary<void>;

/// a typedef for an [NullaryDelegate] that returns a `void`
typedef NullaryVoidDelegate = NullaryDelegate<void>;

/// a typedef for an [UnaryAsync] that returns a `Future<void>`
typedef UnaryVoidAsync<T> = UnaryAsync<void, T>;

/// a typedef for an [UnaryDelegateAsync] that returns a `Future<void>`
typedef UnaryVoidDelegateAsync<T> = UnaryDelegateAsync<void, T>;

/// a typedef for an [Nullary] that returns a `Future<void>`
typedef NullaryVoidAsync = NullaryAsync<void>;

/// a typedef for an [NullaryDelegateAsync] that returns a `Future<void>`
typedef NullaryVoidDelegateAsync = NullaryDelegateAsync<void>;

/// a typedef for an [UnaryAsync] that returns a `Future<void>`
typedef UnaryVoidFutureOr<T> = UnaryFutureOr<void, T>;

/// a typedef for an [UnaryDelegateAsync] that returns a `Future<void>`
typedef UnaryVoidDelegateFutureOr<T> = UnaryDelegateFutureOr<void, T>;

/// a typedef for an [Nullary] that returns a `Future<void>`
typedef NullaryVoidFutureOr = NullaryFutureOr<void>;

/// a typedef for an [NullaryDelegateAsync] that returns a `Future<void>`
typedef NullaryVoidDelegatFutureOr = NullaryDelegateFutureOr<void>;

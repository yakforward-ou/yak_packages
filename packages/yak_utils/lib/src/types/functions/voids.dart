import '../../all.dart';

/// a typedef for an [Unary] that returns a `void`
typedef UnaryVoid<T> = Unary<void, T>;

/// a typedef for an [Nullary] that returns a `void`
typedef NullaryVoid = Nullary<void>;

/// a typedef for an [UnaryAsync] that returns a `Future<void>`
typedef UnaryVoidAsync<T> = UnaryAsync<void, T>;

/// a typedef for an [Nullary] that returns a `Future<void>`
typedef NullaryVoidAsync = NullaryAsync<void>;

/// a typedef for an [UnaryAsync] that returns a `Future<void>`
typedef UnaryVoidFutureOr<T> = UnaryFutureOr<void, T>;

/// a typedef for an [Nullary] that returns a `Future<void>`
typedef NullaryVoidFutureOr = NullaryFutureOr<void>;

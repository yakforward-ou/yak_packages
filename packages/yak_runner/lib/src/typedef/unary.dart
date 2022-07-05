import 'package:yak_result/yak_result.dart';

typedef Unary<T, S> = T Function(S);

typedef UnaryAsync<T, S> = Future<T> Function(S);

typedef RunUnarySync<T, S> = Unary<Result<T>, S>;

typedef RunUnaryAsync<T, S> = UnaryAsync<Result<T>, S>;

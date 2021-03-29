/// provides a default NULLARY stub`
/// that reminds the user that a Function must be provided
T Function() defaultStub<T>() => () => throw Exception(
      '`stub` has not been set, '
      'please provide a `${T.runtimeType} Function()`',
    );

/// provides a default UNARY `stub`
/// that reminds the user that a Function must be provided
T Function(S) defaultUnaryStub<T, S>() => (_) => throw Exception(
      '`stub` has not been set, '
      'please provide a `${T.runtimeType} Function()`',
    );

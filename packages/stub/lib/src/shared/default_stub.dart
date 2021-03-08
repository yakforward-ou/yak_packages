/// provides a default `stub`
/// that reminds the user that a Function must be provided
T Function() defaultStub<T>() => () => throw Exception(
      '`stub` has not been set, '
      'please provide a `${T.runtimeType} Function()`',
    );

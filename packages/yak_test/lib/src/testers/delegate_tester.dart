import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

/// ensure [NullaryDelegate] call equals encapsulated function
void nullaryDelegateTest<T, S extends NullaryDelegate<T>>(Nullary<S> tester) {
  test(
    'GIVEN a NullaryDelegate<$T> '
    'WHEN delagate.call '
    'THEN is a Nullary<$T>',
    () => expect(
      tester().call,
      isA<Nullary<T>>(),
      reason: 'type should match',
    ),
  );
}

/// ensure [NullaryDelegateAsync] call equals encapsulated function
void nullaryDelegateAsyncTest<T, S extends NullaryDelegateAsync<T>>(
  Nullary<S> tester,
) =>
    test(
      'GIVEN a NullaryDelegateAsync<$T> '
      'WHEN delagate.call '
      'THEN is a NullaryAsync<$T>',
      () => expect(
        tester().call,
        isA<NullaryAsync<T>>(),
        reason: 'type should match',
      ),
    );

/// ensure [NullaryDelegate] call equals encapsulated function
void unaryDelegateTest<T, S, R extends UnaryDelegate<T, S>>(
  Nullary<R> tester,
) =>
    test(
      'GIVEN a UnaryDelegate<$T, $S> '
      'WHEN delagate.call '
      'THEN is a Nullary<$T>',
      () => expect(
        tester().call,
        isA<Unary<T, S>>(),
        reason: 'type should match',
      ),
    );

/// ensure [NullaryDelegateAsync] call equals encapsulated function
void unaryDelegatAsyncTest<T, S, R extends UnaryDelegate<T, S>>(
  Nullary<R> tester,
) =>
    test(
      'GIVEN a UnaryDelegate<$T, $S> '
      'WHEN delagate.call '
      'THEN is a Nullary<$T>',
      () => expect(
        tester().call,
        isA<Unary<T, S>>(),
        reason: 'type should match',
      ),
    );

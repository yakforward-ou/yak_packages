import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

/// ensure [NullaryDelegate] call equals encapsulated function
void nullaryDelegateTest<T>(
  NullaryDelegate<T> tester,
) {
  test(
      'GIVEN a NullaryDelegate<$T> '
      'WHEN delagate.call '
      'THEN is a Nullary<$T>', () {
    expect(
      tester.call,
      isA<Nullary<T>>(),
      reason: 'type should match',
    );
  });
}

/// ensure [NullaryDelegateAsync] call equals encapsulated function
void nullaryDelegateAsyncTest<T>(
  NullaryDelegateAsync<T> tester,
) {
  test(
      'GIVEN a NullaryDelegateAsync<$T> '
      'WHEN delagate.call '
      'THEN is a NullaryAsync<$T>', () {
    expect(
      tester.call,
      isA<NullaryAsync<T>>(),
      reason: 'type should match',
    );
  });
}

/// ensure [NullaryDelegate] call equals encapsulated function
void unaryDelegateTest<T, S>(
  UnaryDelegate<T, S> tester,
) {
  test(
      'GIVEN a UnaryDelegate<$T,$S> '
      'WHEN delagate.call '
      'THEN is a Unary<$T,$S>', () {
    expect(
      tester.call,
      isA<Unary<T, S>>(),
      reason: 'type should match',
    );
  });
}

/// ensure [NullaryDelegateAsync] call equals encapsulated function
void unaryDelegatAsyncTest<T, S>(
  UnaryDelegateAsync<T, S> tester,
) {
  test(
      'GIVEN a UnaryDelegateAsync<$T,$S> '
      'WHEN delagate.call '
      'THEN is a UnaryAsync<$T,$S>', () {
    expect(
      tester.call,
      isA<UnaryAsync<T, S>>(),
      reason: 'type should match',
    );
  });
}

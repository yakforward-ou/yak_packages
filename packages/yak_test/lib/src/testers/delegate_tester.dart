import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

/// ensure [NullaryDelegate] call equals encapsulated function
void nullaryDelegateTest<T, S extends NullaryDelegate<T>>(Nullary<S> tester) =>
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

/// ensure [MultiDelegate2] call equals encapsulated function
void multiDelegate2Test<T, S, R, Q extends MultiDelegate2<T, S, R>>(
  Nullary<Q> tester,
) =>
    test(
      'GIVEN MultiDelegate2 '
      'WHEN delegate.call '
      'THEN returns a MultiArgFunction2',
      () => expect(
        tester().call,
        isA<MultiArgFunction2<T, S, R>>(),
        reason: 'delegate.call should be predictable',
      ),
    );

/// ensure [MultiDelegate3] call equals encapsulated function
void multiDelegate3Test<T, S, R, Q, P extends MultiDelegate3<T, S, R, Q>>(
  Nullary<P> tester,
) =>
    test(
      'GIVEN MultiDelegate3 '
      'WHEN delegate.call '
      'THEN returns a MultiArgFunction3',
      () => expect(
        tester().call,
        isA<MultiArgFunction3<T, S, R, Q>>(),
        reason: 'delegate.call should be predictable',
      ),
    );

/// ensure [MultiDelegate4] call equals encapsulated function
void multiDelegate4Test<T, S, R, Q, P, O extends MultiDelegate4<T, S, R, Q, P>>(
  Nullary<O> tester,
) =>
    test(
      'GIVEN MultiDelegate3 '
      'WHEN delegate.call '
      'THEN returns a MultiArgFunction3',
      () => expect(
        tester().call,
        isA<MultiArgFunction4<T, S, R, Q, P>>(),
        reason: 'delegate.call should be predictable',
      ),
    );

/// ensure [MultiDelegate5] call equals encapsulated function
void multiDelegate5Test<T, S, R, Q, P, O,
        N extends MultiDelegate5<T, S, R, Q, P, O>>(
  Nullary<N> tester,
) =>
    test(
      'GIVEN MultiDelegate3 '
      'WHEN delegate.call '
      'THEN returns a MultiArgFunction3',
      () => expect(
        tester().call,
        isA<MultiArgFunction5<T, S, R, Q, P, O>>(),
        reason: 'delegate.call should be predictable',
      ),
    );

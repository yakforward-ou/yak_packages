import 'package:test/test.dart';

import 'mock.dart';

void main() {
  final mock = FooMock();
  const j = 0;
  const w = 's';
  const expectedFooCount = 2;
  const expectedBarCount = 3;
  const expectedBazCount = 4;
  const expectedFizzCount = 5;
  const nextNullaryResult = 9999;
  const nextUnaryResult = 'hello';

  group('`StubMethod` MOCK test', () {
    test(
        'GIVEN `mock[...] is not set` '
        'WHEN mock[...] is called '
        'THEN throw `Exception`', () {
      expect(
        () => mock['oppa gangnam style'],
        throwsA(isA<Exception>()),
        reason: '`mock[...]` should throw `Exception`',
      );
    });
    test(
        'GIVEN `mock[...] is set` and `mock[...].stub` is not set '
        'WHEN `mock[...].stub` is called '
        'THEN throw `UnimplementedError`', () {
      expect(
        mock['foo'].stub,
        throwsA(isA<UnimplementedError>()),
        reason: '`mock[...].stub` should throw `UnimplementedError`',
      );
    });
    test(
        'GIVEN `mock[...] is set` '
        'WHEN `mock[...].stub` try setting a wrong function'
        'THEN throws an `Error`', () {
      expect(
        () => mock['foo'].stub = (i) => '$i',
        throwsA(isA<Error>()),
        reason: '${mock['foo'].stub} should throw if wrong function is set',
      );
      expect(
        () => mock['bar'].stub = () => j,
        throwsA(isA<Error>()),
        reason: '${mock['foo'].stub} should throw if wrong function is set',
      );
      expect(
        () => mock['baz'].stub = () => j,
        throwsA(isA<Error>()),
        reason: '${mock['foo'].stub} should throw if wrong function is set',
      );
      expect(
        () => mock['fizz'].stub = () => j,
        throwsA(isA<Error>()),
        reason: '${mock['foo'].stub} should throw if wrong function is set',
      );
    });
    test(
        'GIVEN `mock[...] is set` and `mock[...].stub` is also set '
        'WHEN `mock[...].stub` is called '
        'THEN return the stored function', () {
      mock['foo'].stub = () => j;
      mock['bar'].stub = (i) => '$i';
      mock['baz'].stub = (l) => '${l[0]}${l[1]}';
      mock['fizz'].stub = (m) => '${m["i"]}${m["s"]}';

      expect(
        mock['foo'].stub,
        isA<int Function()>(),
        reason: '`mock[...].stub` should return the stored function',
      );
      expect(
        mock['bar'].stub,
        isA<String Function(int)>(),
        reason: '`mock[...].stub` should return the stored function',
      );
      expect(
        mock['baz'].stub,
        isA<String Function(List)>(),
        reason: '`mock[...].stub` should return the stored function',
      );
      expect(
        mock['fizz'].stub,
        isA<String Function(Map)>(),
        reason: '`mock[...].stub` should return the stored function',
      );
    });
    test(
        'GIVEN `mock[...] ... '
        'WHEN `mock.reset` is called '
        'THEN stubbed functions persists', () {
      mock.reset;
      expect(
        mock['foo'].stub,
        isA<int Function()>(),
        reason: '`mock[...].stub` should return the stored function',
      );
      expect(
        mock['bar'].stub,
        isA<String Function(int)>(),
        reason: '`mock[...].stub` should return the stored function',
      );
      expect(
        mock['baz'].stub,
        isA<String Function(List)>(),
        reason: '`mock[...].stub` should return the stored function',
      );
      expect(
        mock['fizz'].stub,
        isA<String Function(Map)>(),
        reason: '`mock[...].stub` should return the stored function',
      );
    });
    test(
        'GIVEN proper set up '
        'WHEN `mock.stubbedFun` is called '
        'THEN return a predictable result', () {
      mock.reset;

      expect(
        mock.foo(),
        j,
        reason: '`mock[...].stub()` return a predictable result',
      );
      expect(
        mock.bar(j),
        '$j',
        reason: '`mock[...].stub(*)` return a predictable result',
      );
      expect(
        mock.baz(j, w),
        '$j$w',
        reason: '`mock[...].stub(*)` return a predictable result',
      );
      expect(
        mock.fizz(i: j, s: w),
        '$j$w',
        reason: '`mock[...].stub(*)` return a predictable result',
      );
    });
    test(
        'GIVEN proper set up '
        'WHEN when a stubbed function is called '
        'THEN `count` increase ', () {
      mock.reset;

      for (var i = 0; i < expectedFooCount; ++i) {
        mock.foo();
      }
      for (var i = 0; i < expectedBarCount; ++i) {
        mock.bar(i);
      }
      for (var i = 0; i < expectedBazCount; ++i) {
        mock.baz(i, '$i');
      }
      for (var i = 0; i < expectedFizzCount; ++i) {
        mock.fizz(i: i, s: '$i');
      }
    });
    test(
        'GIVEN ... '
        'WHEN reset is not called '
        'THEN `count` should persist ', () {
      /// mock.reset;
      expect(
        mock['foo'].count,
        expectedFooCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock['bar'].count,
        expectedBarCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock['baz'].count,
        expectedBazCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock['fizz'].count,
        expectedFizzCount,
        reason: '`mock[...].count` should return expected result',
      );
    });

    test(
        'GIVEN ... '
        'WHEN reset and calls on single stubs '
        'THEN other stubs are not affeted ', () {
      /// mock.reset;
      mock.foo();
      mock['bar'].reset;

      expect(
        mock['foo'].count,
        expectedFooCount + 1,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock['bar'].count,
        0,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock['baz'].count,
        expectedBazCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock['fizz'].count,
        expectedFizzCount,
        reason: '`mock[...].count` should return expected result',
      );
    });
    test(
        'GIVEN ... '
        'WHEN new stub is set'
        'THEN then returns new result', () {
      mock['foo'].stub = () => nextNullaryResult;
      mock['bar'].stub = (_) => nextUnaryResult;
      mock['baz'].stub = (_) => nextUnaryResult;
      mock['fizz'].stub = (_) => nextUnaryResult;

      expect(
        mock.foo(),
        nextNullaryResult,
        reason: '`mock[...].stub()` return a predictable result',
      );
      expect(
        mock.bar(j),
        nextUnaryResult,
        reason: '`mock[...].stub(*)` return a predictable result',
      );
      expect(
        mock.baz(j, w),
        nextUnaryResult,
        reason: '`mock[...].stub(*)` return a predictable result',
      );
      expect(
        mock.fizz(i: j, s: w),
        nextUnaryResult,
        reason: '`mock[...].stub(*)` return a predictable result',
      );
    });
  });
}

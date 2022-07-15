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

  group('`Stub` MOCK test', () {
    test(
        'GIVEN `mock[...] is set` and `mock[...].call` is not set '
        'WHEN `mock[...].call` is called '
        'THEN throw `UnimplementedError`', () {
      expect(
        mock.fooStub.call,
        throwsA(isA<UnimplementedError>()),
        reason: '`mock[...].call` should throw `UnimplementedError`',
      );
    });
    test(
        'GIVEN `mock[...] is set` and `mock[...].call` is also set '
        'WHEN `mock[...].call` is called '
        'THEN return the stored function', () {
      mock.fooStub.stub = () => j;
      mock.barStub.stub = (i) => '$i';
      mock.bazStub.stub = (l) => '${l[0]}${l[1]}';
      mock.fizzStub.stub = (m) => '${m["i"]}${m["s"]}';

      expect(
        mock.fooStub.call,
        isA<int Function()>(),
        reason: '`mock[...].call` should return the stored function',
      );
      expect(
        mock.barStub.call,
        isA<String Function(int)>(),
        reason: '`mock[...].call` should return the stored function',
      );
      expect(
        mock.bazStub.call,
        isA<String Function(List)>(),
        reason: '`mock[...].call` should return the stored function',
      );
      expect(
        mock.fizzStub.call,
        isA<String Function(Map)>(),
        reason: '`mock[...].call` should return the stored function',
      );
    });
    test(
        'GIVEN `mock[...] ... '
        'WHEN `mock.reset()` is called '
        'THEN stubbed functions persists', () {
      mock.reset();
      expect(
        mock.fooStub.call,
        isA<int Function()>(),
        reason: '`mock[...].call` should return the stored function',
      );
      expect(
        mock.barStub.call,
        isA<String Function(int)>(),
        reason: '`mock[...].call` should return the stored function',
      );
      expect(
        mock.bazStub.call,
        isA<String Function(List)>(),
        reason: '`mock[...].call` should return the stored function',
      );
      expect(
        mock.fizzStub.call,
        isA<String Function(Map)>(),
        reason: '`mock[...].call` should return the stored function',
      );
    });
    test(
        'GIVEN proper set up '
        'WHEN `mock.callbedFun` is called '
        'THEN return a predictable result', () {
      mock.reset();

      expect(
        mock.foo(),
        j,
        reason: '`mock[...]()` return a predictable result',
      );
      expect(
        mock.bar(j),
        '$j',
        reason: '`mock[...].call(*)` return a predictable result',
      );
      expect(
        mock.baz(j, w),
        '$j$w',
        reason: '`mock[...].call(*)` return a predictable result',
      );
      expect(
        mock.fizz(i: j, s: w),
        '$j$w',
        reason: '`mock[...].call(*)` return a predictable result',
      );
    });
    test(
        'GIVEN proper set up '
        'WHEN when a stubbed function is called '
        'THEN `count` increase ', () {
      mock.reset();

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
        'WHEN reset() is not called '
        'THEN `count` should persist ', () {
      /// mock.reset();
      expect(
        mock.fooStub.count,
        expectedFooCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock.barStub.count,
        expectedBarCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock.bazStub.count,
        expectedBazCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock.fizzStub.count,
        expectedFizzCount,
        reason: '`mock[...].count` should return expected result',
      );
    });

    test(
        'GIVEN ... '
        'WHEN reset() and calls on single stubs '
        'THEN other stubs are not affected ', () {
      /// mock.reset();
      mock.foo();
      mock.barStub.reset();

      expect(
        mock.fooStub.count,
        expectedFooCount + 1,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock.barStub.count,
        0,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock.bazStub.count,
        expectedBazCount,
        reason: '`mock[...].count` should return expected result',
      );
      expect(
        mock.fizzStub.count,
        expectedFizzCount,
        reason: '`mock[...].count` should return expected result',
      );
    });
    test(
        'GIVEN ... '
        'WHEN new stub is set'
        'THEN then returns new result', () {
      mock.fooStub.stub = () => nextNullaryResult;
      mock.barStub.stub = (_) => nextUnaryResult;
      mock.bazStub.stub = (_) => nextUnaryResult;
      mock.fizzStub.stub = (_) => nextUnaryResult;

      expect(
        mock.foo(),
        nextNullaryResult,
        reason: '`mock[...]()` return a predictable result',
      );
      expect(
        mock.bar(j),
        nextUnaryResult,
        reason: '`mock[...].call(*)` return a predictable result',
      );
      expect(
        mock.baz(j, w),
        nextUnaryResult,
        reason: '`mock[...].call(*)` return a predictable result',
      );
      expect(
        mock.fizz(i: j, s: w),
        nextUnaryResult,
        reason: '`mock[...].call(*)` return a predictable result',
      );
    });
    test(
        'GIVEN ... '
        'WHEN when stub throws'
        'THEN then error flows throgh', () {
      mock.fooStub.stub = () {
        assert(false);
        return 1;
      };

      expect(
        mock.foo,
        throwsA(isA<AssertionError>()),
        reason: '`mock.foo` should throw an `AssertionError`',
      );
    });
  });
}

import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

class _NullaryTester extends Mock implements NullaryDelegate<int> {}

class _NullaryTesterAsync extends Mock implements NullaryDelegateAsync<int> {}

class _UnaryTester extends Mock implements UnaryDelegate<int, bool> {}

class _UnaryTesterAsync extends Mock implements UnaryDelegateAsync<int, bool> {}

class _MultiDelegate2Tester extends Mock
    implements MultiDelegate2<String, int, double> {}

class _MultiDelegate3Tester extends Mock
    implements MultiDelegate3<String, int, double, num> {}

class _MultiDelegate4Tester extends Mock
    implements MultiDelegate4<String, int, double, num, bool> {}

class Foo {}

class _MultiDelegate5Tester extends Mock
    implements MultiDelegate5<String, int, double, num, bool, Foo> {}

void main() {
  group(
    'nullaryDelegateTest',
    () => nullaryDelegateTest(_NullaryTester.new),
  );

  group(
    'nullaryDelegateAsyncTest',
    () => nullaryDelegateAsyncTest(_NullaryTesterAsync.new),
  );

  group(
    'unaryDelegateTest',
    () => unaryDelegateTest(_UnaryTester.new),
  );

  group(
    'unaryDelegatAsyncTest',
    () => unaryDelegatAsyncTest(_UnaryTesterAsync.new),
  );

  group(
    'multiDelegate2Test',
    () => multiDelegate2Test(_MultiDelegate2Tester.new),
  );

  group(
    'multiDelegate3Test',
    () => multiDelegate3Test(_MultiDelegate3Tester.new),
  );

  group(
    'multiDelegate4Test',
    () => multiDelegate4Test(_MultiDelegate4Tester.new),
  );

  group(
    'multiDelegate5Test',
    () => multiDelegate5Test(_MultiDelegate5Tester.new),
  );
}

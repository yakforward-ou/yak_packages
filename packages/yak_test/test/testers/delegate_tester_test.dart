import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

class NullaryTester extends Mock implements NullaryDelegate<int> {}

class NullaryTesterAsync extends Mock implements NullaryDelegateAsync<int> {}

class UnaryTester extends Mock implements UnaryDelegate<int, bool> {}

class UnaryTesterAsync extends Mock implements UnaryDelegateAsync<int, bool> {}

void main() {
  group('nullaryDelegateTest', () {
    nullaryDelegateTest(() => NullaryTester());
  });

  group('equalityTest String', () {
    nullaryDelegateAsyncTest(() => NullaryTesterAsync());
  });

  group('nullaryDelegateTest', () {
    unaryDelegateTest(() => UnaryTester());
  });

  group('equalityTest String', () {
    unaryDelegatAsyncTest(() => UnaryTesterAsync());
  });
}

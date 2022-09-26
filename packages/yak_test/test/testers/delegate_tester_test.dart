import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/yak_test.dart';

class NullaryTester implements NullaryDelegate<int> {
  const NullaryTester();
  @override
  int call() => throw UnimplementedError();
}

class NullaryTesterAsync implements NullaryDelegateAsync<int> {
  const NullaryTesterAsync();

  @override
  Future<int> call() async => throw UnimplementedError();
}

class UnaryTester implements UnaryDelegate<int, bool> {
  const UnaryTester();

  @override
  int call(_) => throw UnimplementedError();
}

class UnaryTesterAsync implements UnaryDelegateAsync<int, bool> {
  const UnaryTesterAsync();

  @override
  Future<int> call(_) async => throw UnimplementedError();
}

void main() {
  group('nullaryDelegateTest', () {
    nullaryDelegateTest(NullaryTester());
  });
  group('equalityTest String', () {
    nullaryDelegateAsyncTest(NullaryTesterAsync());
  });

  group('nullaryDelegateTest', () {
    unaryDelegateTest(UnaryTester());
  });
  group('equalityTest String', () {
    unaryDelegatAsyncTest(UnaryTesterAsync());
  });
}

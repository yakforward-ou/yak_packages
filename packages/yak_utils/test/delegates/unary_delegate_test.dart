import 'package:test/test.dart';
import 'package:yak_test/yak_test.dart';
import 'package:yak_utils/yak_utils.dart';
import 'package:mocktail/mocktail.dart';

class _UnaryTester extends Mock implements UnaryDelegate<int, bool> {}

class _UnaryTesterAsync extends Mock implements UnaryDelegateAsync<int, bool> {}

void main() {
  group(
    'UnaryDelegate Test',
    () {
      constructorTester(_UnaryTester.new);
      unaryDelegateTest(_UnaryTester.new);
    },
  );

  group(
    'UnaryDelegateAsync Test',
    () {
      constructorTester(_UnaryTesterAsync.new);
      unaryDelegatAsyncTest(_UnaryTesterAsync.new);
    },
  );
}

import 'package:yak_runner/yak_runner.dart';
import '../../../testers/simple/void/async_delegate_test.dart';

class TryRunAsyncTestFactory implements VoidTestFactoryDelegate {
  const TryRunAsyncTestFactory(this.description);
  final String description;
  @override
  VoidTestDelegate call() => TryRunAsyncTester(description: description);
}

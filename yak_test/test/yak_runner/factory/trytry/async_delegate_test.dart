import 'package:yak_runner/yak_runner.dart';
import '../../testers/trytry/async_delegate_test.dart';

class TryRunTryAsyncTestFactory implements VoidTestFactoryDelegate {
  const TryRunTryAsyncTestFactory(this.description);
  final String description;
  @override
  VoidTestDelegate call() => TryRunTryAsyncTester(description: description);
}

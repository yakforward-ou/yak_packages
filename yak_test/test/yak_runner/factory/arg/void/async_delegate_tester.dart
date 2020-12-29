import 'package:yak_runner/yak_runner.dart';
import '../../../testers/arg/void/async_delegate_tester.dart';

class TryRunArgAsyncTestFactory implements ArgTestFactoryDelegate {
  const TryRunArgAsyncTestFactory(this.description);
  final String description;
  @override
  ArgTestDelegate<S> call<S>() =>
      TryRunArgAsyncTester<S>(description: description);
}

import 'package:yak_runner/yak_runner.dart';
import '../../../testers/tryarg/void/async_delegate_test.dart';

class TryRunTryArgAsyncTestFactory implements ArgTestFactoryDelegate {
  const TryRunTryArgAsyncTestFactory(this.description);
  final String description;
  @override
  ArgTestDelegate<S> call<S>() =>
      TryRunTryArgAsyncTester<S>(description: description);
}

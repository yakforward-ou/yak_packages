import 'package:yak_runner/yak_runner.dart';
import '../../../testers/arg/any/async_delegate_tester.dart';

class TryAnyRunArgAsyncTestFactory implements ArgResultTestFactoryDelegate {
  const TryAnyRunArgAsyncTestFactory(this.description);
  final String description;
  @override
  ArgResultTestDelegate<T, S> call<T, S>() =>
      TryAnyRunArgAsyncTester<T, S>(description: description);
}

extension TestFactoryExtension on TryAnyRunArgAsync {
  void runTest(description) =>
      this.buildTest(TryAnyRunArgAsyncTestFactory(description));
}

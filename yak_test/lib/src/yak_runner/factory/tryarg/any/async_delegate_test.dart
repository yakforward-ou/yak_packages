import 'package:yak_runner/yak_runner.dart';
import '../../../testers/tryarg/any/async_delegate_test.dart';

class TryAnyRunTryArgAsyncTestFactory implements ArgResultTestFactoryDelegate {
  const TryAnyRunTryArgAsyncTestFactory(this.description);
  final String description;
  @override
  ArgResultTestDelegate<T, S> call<T, S>() =>
      TryAnyRunTryArgAsyncTester<T, S>(description: description);
}

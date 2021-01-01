import 'package:yak_runner/yak_runner.dart';
import '../../../testers/arg/any/delegate_tester.dart';

class TryAnyRunArgTestFactory implements ArgResultTestFactoryDelegate {
  const TryAnyRunArgTestFactory(this.description);
  final String description;
  @override
  ArgResultTestDelegate<T, S> call<T, S>() =>
      TryAnyRunArgTester<T, S>(description: description);
}

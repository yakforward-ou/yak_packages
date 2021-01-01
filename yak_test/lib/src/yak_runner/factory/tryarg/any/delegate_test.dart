import 'package:yak_runner/yak_runner.dart';
import '../../../testers/tryarg/any/delegate_test.dart';

class TryAnyRunTryArgTestFactory implements ArgResultTestFactoryDelegate {
  const TryAnyRunTryArgTestFactory(this.description);
  final String description;
  @override
  ArgResultTestDelegate<T, S> call<T, S>() =>
      TryAnyRunTryArgTester<T, S>(description: description);
}

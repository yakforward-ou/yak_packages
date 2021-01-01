import 'package:yak_runner/yak_runner.dart';
import '../../../testers/tryarg/void/delegate_test.dart';

class TryRunTryArgTestFactory implements ArgTestFactoryDelegate {
  const TryRunTryArgTestFactory(this.description);
  final String description;
  @override
  ArgTestDelegate<S> call<S>() =>
      TryRunTryArgTester<S>(description: description);
}

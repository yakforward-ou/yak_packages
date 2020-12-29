import 'package:yak_runner/yak_runner.dart';
import '../../../testers/arg/void/delegate_tester.dart';

class TryRunArgTestFactory implements ArgTestFactoryDelegate {
  const TryRunArgTestFactory(this.description);
  final String description;
  @override
  ArgTestDelegate<S> call<S>() => TryRunArgTester<S>(description: description);
}

extension TestFactoryExtension on TryAnyRunArg {
  ArgTestFactoryDelegate buildTestFactory(description) =>
      TryRunArgTestFactory(description);
}

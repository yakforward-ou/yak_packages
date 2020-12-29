import 'package:yak_runner/yak_runner.dart';
import '../../testers/trytry/delegate_test.dart';

class TryRunTryTestFactory implements VoidTestFactoryDelegate {
  const TryRunTryTestFactory(this.description);
  final String description;
  @override
  VoidTestDelegate call() => TryRunTryTester(description: description);
}

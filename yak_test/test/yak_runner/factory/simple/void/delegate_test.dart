import 'package:yak_runner/yak_runner.dart';
import '../../../testers/simple/void/delegate_test.dart';

class TryRunTestFactory implements VoidTestFactoryDelegate {
  const TryRunTestFactory(this.description);
  final String description;
  @override
  VoidTestDelegate call() => TryRunTester(description: description);
}

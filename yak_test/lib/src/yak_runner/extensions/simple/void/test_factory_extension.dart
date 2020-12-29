import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunTestFactoryExtension on TryRun {
  VoidTestDelegate buildTester(String description) =>
      this.buildTest(TryRunTestFactory(description));
}

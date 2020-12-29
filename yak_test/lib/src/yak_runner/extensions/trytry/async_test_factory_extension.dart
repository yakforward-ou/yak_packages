import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunTryAsyncTestFactoryExtension on TryRunTryAsync {
  VoidTestDelegate buildTester(String description) =>
      this.buildTest(TryRunTryAsyncTestFactory(description));
}

import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunAsyncTestFactoryExtension on TryRunAsync {
  VoidTestDelegate buildTester(String description) =>
      this.buildTest(TryRunAsyncTestFactory(description));
}

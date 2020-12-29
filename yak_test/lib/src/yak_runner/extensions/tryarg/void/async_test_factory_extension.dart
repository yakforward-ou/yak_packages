import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunTryArgAsyncTestFactoryExtension on TryRunTryArgAsync {
  ArgTestDelegate buildTester(String description) =>
      this.buildTest(TryRunTryArgAsyncTestFactory(description));
}

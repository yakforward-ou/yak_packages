import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunArgAsyncTestFactoryExtension on TryRunArgAsync {
  ArgTestDelegate buildTester(String description) =>
      this.buildTest(TryRunArgAsyncTestFactory(description));
}

import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunArgAsyncTestFactoryExtension on TryRunArgAsync {
  void runTest(description) =>
      this.buildTest(TryRunArgAsyncTestFactory(description));
}

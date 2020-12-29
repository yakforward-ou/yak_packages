import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunTryArgAsyncTestFactoryExtension on TryAnyRunTryArgAsync {
  void runTest(description) =>
      this.buildTest(TryAnyRunTryArgAsyncTestFactory(description));
}

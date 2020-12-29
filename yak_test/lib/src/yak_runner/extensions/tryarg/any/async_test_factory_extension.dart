import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunTryArgAsyncTestFactoryExtension on TryAnyRunTryArgAsync {
  ArgResultTestDelegate buildTester(String description) =>
      this.buildTest(TryAnyRunTryArgAsyncTestFactory(description));
}

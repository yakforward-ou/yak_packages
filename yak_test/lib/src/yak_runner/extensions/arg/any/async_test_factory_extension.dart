import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunArgAsyncTestFactoryExtension on TryAnyRunArgAsync {
  ArgResultTestDelegate buildTester(String description) =>
      this.buildTest(TryAnyRunArgAsyncTestFactory(description));
}

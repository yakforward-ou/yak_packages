import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunAsyncTestFactoryExtension on TryAnyRunAsync {
  ResultTestDelegate buildTester(String description) =>
      this.buildTest(TryAnyRunAsyncTestFactory(description));
}

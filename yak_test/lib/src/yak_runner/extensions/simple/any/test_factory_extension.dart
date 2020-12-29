import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunTestFactoryExtension on TryAnyRun {
  ResultTestDelegate buildTester(String description) =>
      this.buildTest(TryAnyRunTestFactory(description));
}

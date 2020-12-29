import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunArgTestFactoryExtension on TryRunArg {
  ArgTestDelegate buildTester(String description) =>
      this.buildTest(TryRunArgTestFactory(description));
}

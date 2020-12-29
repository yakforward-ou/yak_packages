import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunTryArgTestFactoryExtension on TryRunTryArg {
  ArgTestDelegate buildTester(String description) =>
      this.buildTest(TryRunTryArgTestFactory(description));
}

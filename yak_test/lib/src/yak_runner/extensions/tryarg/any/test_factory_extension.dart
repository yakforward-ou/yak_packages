import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunTryArgTestFactoryExtension on TryAnyRunTryArg {
  ArgResultTestDelegate buildTester(String description) =>
      this.buildTest(TryAnyRunTryArgTestFactory(description));
}

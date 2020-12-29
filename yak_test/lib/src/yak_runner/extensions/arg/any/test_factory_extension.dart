import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunArgTestFactoryExtension on TryAnyRunArg {
  ArgResultTestDelegate buildTester(String description) =>
      this.buildTest(TryAnyRunArgTestFactory(description));
}

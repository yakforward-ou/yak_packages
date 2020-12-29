import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';
import '../../../testers/all.dart';

extension TryAnyRunArgTestFactoryExtension on TryAnyRunArg {
  TryAnyRunArgTester runTest(description) =>
      this.buildTest(TryAnyRunArgTestFactory(description));
}

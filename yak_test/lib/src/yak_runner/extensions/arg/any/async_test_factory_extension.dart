import 'package:yak_runner/yak_runner.dart';
import '../../../testers/all.dart';
import '../../../factory/all.dart';

extension TryAnyRunArgAsyncTestFactoryExtension on TryAnyRunArgAsync {
  TryAnyRunArgAsyncTester runTest(description) =>
      this.buildTest(TryAnyRunArgAsyncTestFactory(description));
}

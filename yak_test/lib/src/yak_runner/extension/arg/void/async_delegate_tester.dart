import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunArgAsyncTestFactoryExtension on TryRunArgAsync {
  TryRunArgAsyncTestFactory buildTestFactory(String description) =>
      TryRunArgAsyncTestFactory(description);
}

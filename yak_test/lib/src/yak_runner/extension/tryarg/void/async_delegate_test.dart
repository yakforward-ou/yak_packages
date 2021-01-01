import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunTryArgAsyncTestFactoryExtension on TryRunTryArgAsync {
  TryRunTryArgAsyncTestFactory buildTestFactory(String description) =>
      TryRunTryArgAsyncTestFactory(description);
}

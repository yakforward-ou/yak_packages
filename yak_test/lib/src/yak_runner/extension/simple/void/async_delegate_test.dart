import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunAsyncTestFactoryExtension on TryRunAsync {
  TryRunAsyncTestFactory buildTestFactory(String description) =>
      TryRunAsyncTestFactory(description);
}

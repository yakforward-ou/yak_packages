import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunTestFactoryExtension on TryRun {
  TryRunTestFactory buildTestFactory(String description) =>
      TryRunTestFactory(description);
}

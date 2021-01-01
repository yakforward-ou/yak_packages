import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunTryTestFactoryExtension on TryRunTry {
  TryRunTryTestFactory buildTestFactory(String description) =>
      TryRunTryTestFactory(description);
}

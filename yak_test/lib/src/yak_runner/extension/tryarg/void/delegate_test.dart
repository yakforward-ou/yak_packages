import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunTryArgTestFactoryExtension on TryRunTryArg {
  TryRunTryArgTestFactory buildTestFactory(String description) =>
      TryRunTryArgTestFactory(description);
}

import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryRunArgTestFactoryExtension on TryRunArg {
  TryRunArgTestFactory buildTestFactory(String description) =>
      TryRunArgTestFactory(description);
}

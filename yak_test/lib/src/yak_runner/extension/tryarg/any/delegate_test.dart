import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryAnyRunTryArgTestFactoryExtension on TryAnyRunTryArg {
  TryAnyRunTryArgTestFactory buildTestFactory(String description) =>
      TryAnyRunTryArgTestFactory(description);
}

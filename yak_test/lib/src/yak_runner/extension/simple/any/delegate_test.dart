import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryAnyRunTestFactoryExtension on TryAnyRun {
  TryAnyRunTestFactory buildTestFactory(String description) =>
      TryAnyRunTestFactory(description);
}

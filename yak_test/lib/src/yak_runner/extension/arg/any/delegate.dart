import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryAnyRunArgTestFactoryExtension on TryAnyRunArg {
  TryAnyRunArgTestFactory buildTestFactory(String description) =>
      TryAnyRunArgTestFactory(description);
}

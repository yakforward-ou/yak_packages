import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryAnyRunTryArgAsyncTestFactoryExtension on TryAnyRunTryArgAsync {
  TryAnyRunTryArgAsyncTestFactory buildTestFactory(String description) =>
      TryAnyRunTryArgAsyncTestFactory(description);
}

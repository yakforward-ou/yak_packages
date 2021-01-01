import 'package:yak_runner/yak_runner.dart';
import 'package:yak_test/src/yak_runner/factory/all.dart';

extension TryAnyRunArgAsyncTestFactoryExtension on TryAnyRunArgAsync {
  TryAnyRunArgAsyncTestFactory buildTestFactory(String description) =>
      TryAnyRunArgAsyncTestFactory(description);
}

import 'package:yak_runner/yak_runner.dart';
import '../../factory/all.dart';

extension TryRunTryAsyncTestFactoryExtension on TryRunTryAsync {
  VoidTestFactoryDelegate buildTestFactory(description) =>
      TryRunTryAsyncTestFactory(description);
}

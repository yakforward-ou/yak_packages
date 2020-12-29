import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunAsyncTestFactoryExtension on TryRunAsync {
  VoidTestFactoryDelegate buildTestFactory(description) =>
      TryRunAsyncTestFactory(description);
}

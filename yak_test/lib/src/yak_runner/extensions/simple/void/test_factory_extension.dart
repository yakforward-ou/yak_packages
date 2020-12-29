import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunTestFactoryExtension on TryRun {
  VoidTestFactoryDelegate buildTestFactory(description) =>
      TryRunTestFactory(description);
}

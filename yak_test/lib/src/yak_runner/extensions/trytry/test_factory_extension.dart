import 'package:yak_runner/yak_runner.dart';
import '../../factory/all.dart';

extension TryRunTryTestFactoryExtension on TryRunTry {
  VoidTestFactoryDelegate buildTestFactory(description) =>
      TryRunTryTestFactory(description);
}

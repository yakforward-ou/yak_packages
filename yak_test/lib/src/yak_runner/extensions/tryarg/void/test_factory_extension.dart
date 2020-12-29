import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunTryArgTestFactoryExtension on TryRunTryArg {
  ArgTestFactoryDelegate buildTestFactory(description) =>
      TryRunTryArgTestFactory(description);
}

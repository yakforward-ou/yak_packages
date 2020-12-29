import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryRunTryArgAsyncTestFactoryExtension on TryRunTryArgAsync {
  ArgTestFactoryDelegate buildTestFactory(description) =>
      TryRunTryArgAsyncTestFactory(description);
}

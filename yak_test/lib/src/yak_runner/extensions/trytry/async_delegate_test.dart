import 'package:yak_runner/yak_runner.dart';
import '../../testers/trytry/async_delegate_test.dart';

extension TryRunTryAsyncTesterFactory on TryRunTryAsync {
  TryRunTryAsyncTester tester(String description) =>
      TryRunTryAsyncTester(description: description);
}

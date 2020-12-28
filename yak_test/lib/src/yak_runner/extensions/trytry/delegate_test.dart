import 'package:flutter_test/flutter_test.dart';
import 'package:yak_runner/yak_runner.dart';
import 'package:mockito/mockito.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/yak_runner.dart';
import '../../testers/trytry/delegate_test.dart';

extension TryRunTryTesterFactory on TryRunTry {
  TryRunTryTester tester(String description) =>
      TryRunTryTester(description: description);
}

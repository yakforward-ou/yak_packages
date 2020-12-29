import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunTestFactoryExtension on TryAnyRun {
  ResultTestFactoryDelegate buildTestFactory(description) =>
      TryAnyRunTestFactory(description);
}

import 'package:yak_runner/yak_runner.dart';
import '../../../factory/all.dart';

extension TryAnyRunAsyncTestFactoryExtension on TryAnyRunAsync {
  ResultTestFactoryDelegate buildTestFactory(description) =>
      TryAnyRunAsyncTestFactory(description);
}

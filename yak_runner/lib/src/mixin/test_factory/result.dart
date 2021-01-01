import '../../delegates/test/result.dart';
import '../../delegates/test_factory/result.dart';

/// for usage and [test] see `yak_test` package for more details

mixin ResultTestFactoryMixin<T> {
  ResultTestDelegate<T> buildTest(ResultTestFactoryDelegate testFactory) =>
      testFactory<T>();
}

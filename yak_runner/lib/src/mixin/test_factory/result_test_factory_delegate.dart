import '../../delegates/test/result_test_delegate.dart';
import '../../delegates/test_factory/result_test_factory_delegate.dart';

/// for usage and [test] see `yak_test` package for more details

mixin ResultTestFactoryMixin<T> {
  ResultTestDelegate<T> buildTest<T>(ResultTestFactoryDelegate testFactory) =>
      testFactory<T>();
}

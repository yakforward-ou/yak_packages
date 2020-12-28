import '../../delegates/test/arg_result_test_delegate.dart';
import '../../delegates/test_factory/arg_result_test_factory_delegate.dart';

/// for usage and [test] see `yak_test` package for more details

mixin ArgResultTestFactoryMixin<T, S> {
  ArgResultTestDelegate<T, S> buildTest<T, S>(
          ArgResultTestFactoryDelegate testFactory) =>
      testFactory<T, S>();
}

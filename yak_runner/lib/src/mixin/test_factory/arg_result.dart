import '../../delegates/test/arg_result.dart';
import '../../delegates/test_factory/arg_result.dart';

/// for usage and [test] see `yak_test` package for more details

mixin ArgResultTestFactoryMixin<T, S> {
  ArgResultTestDelegate<T, S> buildTest(
          ArgResultTestFactoryDelegate testFactory) =>
      testFactory<T, S>();
}

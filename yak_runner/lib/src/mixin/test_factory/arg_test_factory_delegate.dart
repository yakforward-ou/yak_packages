import '../../delegates/test/arg_test_delegate.dart';
import '../../delegates/test_factory/arg_test_factory_delegate.dart';

/// for usage and [test] see `yak_test` package for more details

mixin ArgTestFactoryMixin<S> {
  ArgTestDelegate<S> buildTest<S>(ArgTestFactoryDelegate testFactory) =>
      testFactory<S>();
}

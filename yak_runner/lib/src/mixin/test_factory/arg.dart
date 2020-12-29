import '../../delegates/test/arg.dart';
import '../../delegates/test_factory/arg.dart';

/// for usage and [test] see `yak_test` package for more details

mixin ArgTestFactoryMixin<S> {
  ArgTestDelegate<S> buildTest(ArgTestFactoryDelegate testFactory) =>
      testFactory<S>();
}

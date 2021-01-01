import '../../delegates/test/void.dart';
import '../../delegates/test_factory/void.dart';

/// for usage and [test] see `yak_test` package for more details

mixin VoidTestFactoryMixin {
  VoidTestDelegate buildTest(VoidTestFactoryDelegate testFactory) =>
      testFactory();
}

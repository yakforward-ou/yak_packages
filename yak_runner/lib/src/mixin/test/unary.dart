import 'package:yak_runner/src/delegates/all.dart';

mixin YakRunnerArgTestMixin<T, S> {
  YakRunnerArgTestDelegate<T, S> buildTest(
          YakRunnerArgTestFactoryDelegate testFactory) =>
      testFactory<T, S>();
}

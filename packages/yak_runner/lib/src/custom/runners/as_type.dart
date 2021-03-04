import '../../all.dart';

/// a `YakRunnerArg` that returns a T if contained in a given iterable
class AsType<T, S> extends YakRunnerArg<T, S> {
  /// provide the function to the `super` constructor
  AsType()
      : super(
          (obj) => asType<T>(obj),
          errorsWhitelist: {AsTypeError().ignore},
        );
}

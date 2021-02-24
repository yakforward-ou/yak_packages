import '../../all.dart';

/// a `YakRunnerArg` that returns a T if contained in a given iterable
class TypeAsType<T, S> extends YakRunnerArg<T, S> {
  ///
  TypeAsType()
      : super(
          (obj) => obj as T,
          errorsWhitelist: {TypeError().ignore},
        );
}

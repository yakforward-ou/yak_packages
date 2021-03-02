import '../../../classes/all.dart';

/// a `mixin` on `SuccessBase`
mixin WhenSuccess<T> on SuccessBase<T> {
  ///  `when` implementation in case `Result` is `Success`
  Z when<Z>({
    required Z Function(T) success,
    required Z Function(Object, StackTrace) failure,
  }) =>
      success(data);
}

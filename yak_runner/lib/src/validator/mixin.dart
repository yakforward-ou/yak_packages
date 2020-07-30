import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'interfaces.dart';

/// [YakValidatorMixin] folds, see [dartz] package, the subject
/// in case of [Right] loops to the provided [YakCondition], if any,
/// and a [NullCheck] as soon as a check fails or the loop is complete
/// return the [Either] the initial [Right] value or a the [Left] [Failure]
/// provided by the [YakCondition]

mixin YakValidatorMixin<T> implements YakValidatorInterface<T> {
  @protected
  @override
  Either<Failure, T> validate({
    @required Either<Failure, T> subject,
    List<MapEntry<bool Function(T argument), Failure>> conditions,
    void Function(String condition) onValidationFailure,
  }) =>
      subject.fold<Either<Failure, T>>(
        (Failure l) => Left(l),
        (T r) {
          Either<Failure, T> _r = Right(r);
          (conditions ?? []).insert(
            0,
            MapEntry((dynamic arg) => arg != null, NullFailure()),
          );
          for (int i = 0; i < conditions.length && _r.isRight(); ++i) {
            if (!conditions[i].key(r)) {
              if (onValidationFailure != null) {
                onValidationFailure('${conditions[i].key}');
              }
              _r = Left(conditions[i].value ?? ValidationFailure());
            }
          }
          return _r;
        },
      );
}

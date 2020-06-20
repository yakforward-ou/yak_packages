import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'conditions.dart';
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
    List<YakCondition<T>> conditions,
  }) =>
      subject.fold<Either<Failure, T>>((Failure l) => Left(l), (T r) {
        final NullCheck _nullCheck = NullCheck();
        Either<Failure, T> _r =
            _nullCheck(r) ? Right(r) : Left(_nullCheck.fail);
        if (conditions != null) {
          for (int i = 0; i < conditions.length && _r.isRight(); ++i) {
            if (!conditions[i](r)) {
              _r = Left(conditions[i].fail);
            }
          }
        }
        return _r;
      });
}
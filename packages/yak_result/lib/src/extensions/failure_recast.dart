import '../all.dart';

/// recast a [Failure] with to the desired [Type]
extension RecastFailureX<T> on Failure<T> {
  Failure<S> recast<S>() => Failure(reason, stackTrace);
}

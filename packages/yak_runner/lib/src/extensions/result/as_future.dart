import '../../../yak_runner.dart';

/// an extendsion on Result
extension ResultAsFutureX<T> on Result<T> {
  /// cast a Result as a Future<Result>
  Future<Result<T>> get asFuture => Future.value(this);
}

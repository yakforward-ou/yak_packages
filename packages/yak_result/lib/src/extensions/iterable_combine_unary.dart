import 'package:yak_result/yak_result.dart';

extension IterableUnaryCombineValueResultX<T, S>
    on Iterable<ResultUnary<T, S>> {
  /// returns the result of a list of functions
  ResultUnary<List<T>, S> get combine => (S value) {
        final results = <T>[];
        for (final function in this) {
          final result = function(value);
          if (result.isFailure) {
            return result.failure.recast();
          }
          results.add(result.success.value);
        }
        return Success.value(results);
      };

  /// returns the result of a list of functions
  VoidResultUnary<S> get combineVoid => (S value) {
        for (final function in this) {
          final result = function(value);
          if (result.isFailure) {
            return result.failure.recast();
          }
        }
        return const VoidSuccess();
      };
}

extension IterableUnaryCombineVoidResultX<T> on Iterable<VoidResultUnary<T>> {
  /// returns the result of a list of functions
  VoidResultUnary<T> get combine => (T value) {
        for (final function in this) {
          final result = function(value);
          if (result.isFailure) {
            return result;
          }
        }
        return const VoidSuccess();
      };
}

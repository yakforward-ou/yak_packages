import 'package:yak_result/yak_result.dart';

extension IterableNullaryCombineValueResultX<T> on Iterable<ResultNullary<T>> {
  /// returns the result of a list of functions
  ResultNullary<List<T>> get combine => () {
        final results = <T>[];
        for (final function in this) {
          final result = function();
          if (result.isFailure) {
            return result.failure.recast();
          }
          results.add(result.success.value);
        }
        return Success.value(results);
      };

  /// returns the result of a list of functions
  VoidResultNullary get combineVoid => () {
        for (final function in this) {
          final result = function();
          if (result.isFailure) {
            return result.failure.recast();
          }
        }
        return const VoidSuccess();
      };
}

extension IterableNullaryCombineVoidResultX on Iterable<VoidResultNullary> {
  /// returns the result of a list of functions
  VoidResultNullary get combine => () {
        for (final function in this) {
          final result = function();
          if (result.isFailure) {
            return result;
          }
        }
        return const VoidSuccess();
      };
}

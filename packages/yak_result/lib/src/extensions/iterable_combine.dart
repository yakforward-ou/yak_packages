import '../classes/void_result.dart' show VoidResult;
import '../classes/result.dart' show Result;
import '../typedef/unary_function.dart';
import '../typedef/nullary_function.dart';
import 'recast.dart';

extension IterableUnaryCombineValueResultX<T extends Object, S>
    on Iterable<ResultUnary<T, S>> {
  /// returns the result of a list of functions
  Result<List<T>> combine(S value) {
    final results = <T>[];
    for (final function in this) {
      final result = function(value);
      if (result.isFailure) {
        return result.asFailure.recast();
      }
      results.add(result.asSuccess);
    }
    return Result.success(results);
  }

  /// returns the result of a list of functions
  VoidResult combineVoid(S value) {
    for (final function in this) {
      final result = function(value);
      if (result.isFailure) {
        return result.asFailure.asVoid();
      }
    }
    return const VoidResult.success();
  }
}

extension IterableUnaryCombineVoidResultX<T> on Iterable<VoidResultUnary<T>> {
  /// returns the result of a list of functions
  VoidResult combine(T value) {
    for (final function in this) {
      final result = function(value);
      if (result.isFailure) {
        return result;
      }
    }
    return const VoidResult.success();
  }
}

extension IterableNullaryCombineValueResultX<T extends Object>
    on Iterable<ResultNullary<T>> {
  /// returns the result of a list of functions
  Result<List<T>> combine() {
    final results = <T>[];
    for (final function in this) {
      final result = function();
      if (result.isFailure) {
        return result.asFailure.recast();
      }
      results.add(result.asSuccess);
    }
    return Result.success(results);
  }

  /// returns the result of a list of functions
  VoidResult combineVoid() {
    for (final function in this) {
      final result = function();
      if (result.isFailure) {
        return result.asFailure.asVoid();
      }
    }
    return const VoidResult.success();
  }
}

extension IterableNullaryCombineVoidResultX on Iterable<VoidResultNullary> {
  /// returns the result of a list of functions
  VoidResult combine() {
    for (final function in this) {
      final result = function();
      if (result.isFailure) {
        return result;
      }
    }
    return const VoidResult.success();
  }
}

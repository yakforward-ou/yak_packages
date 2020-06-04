library yak;

import 'dart:async';
import 'package:meta/meta.dart';
import 'package:yak_runner/yak_runner.dart';
export 'package:yak_runner/yak_runner.dart';

abstract class Yak {
  static YakFunction<T, S> function<T, S>({
    @required T Function(S argument) function,
  }) =>
      YakFunction<T, S>(function: function);

  static YakGenerator<T> generator<T>({
    @required T Function() function,
  }) =>
      YakGenerator<T>(function: function);

  static YakAsyncFunction<T, S> asyncFunction<T, S>({
    @required FutureOr<T> Function(FutureOr<S> argument) function,
    Duration timeout,
  }) =>
      YakAsyncFunction<T, S>(
        function: function, // TODO NEED YO ADD timeout
      );

  static YakAsyncGenerator<T> asyncGenerator<T>({
    @required FutureOr<T> Function() function,
    Duration timeout,
  }) =>
      YakAsyncGenerator<T>(
        function: function, // TODO NEED YO ADD timeout
      );
}

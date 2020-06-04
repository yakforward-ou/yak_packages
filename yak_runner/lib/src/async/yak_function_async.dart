import 'dart:async';
import 'package:meta/meta.dart';

abstract class YakAsyncFunctionInterface<T,S> {
  FutureOr<T> call(FutureOr<S> argument);
}

class YakAsyncFunction<T,S> implements YakAsyncFunctionInterface<T,S> {
  final FutureOr<T>  Function(FutureOr<S> argument) function;
  const YakAsyncFunction({
    @required this.function,
  }) : assert(function != null);

  @override
  FutureOr<T> call(FutureOr<S> argument) async => await function(await argument);
}
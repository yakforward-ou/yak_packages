import 'dart:async';
import 'package:meta/meta.dart';

abstract class YakAsyncYieldInterface<T> {
  FutureOr<T> call();
}

class YakAsyncYield<T> implements YakAsyncYieldInterface<T> {
  final FutureOr<T>  Function() function;
  const YakAsyncYield({
    @required this.function,
  }) : assert(function != null);

  @override
  FutureOr<T> call() async => await function();
}
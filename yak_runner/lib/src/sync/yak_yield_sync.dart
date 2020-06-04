import 'package:meta/meta.dart';

abstract class YakYieldInterface<T> {
  T call();
}

class YakYield<T> implements YakYieldInterface<T> {
  final T Function() function;
  const YakYield({
    @required this.function,
  }) : assert(function != null);

  @override
  T call() => function();
}
import 'package:meta/meta.dart';

abstract class YakFunctionInterface<T,S> {
  T call(S argument);
}

class YakFunction<T,S> implements YakFunctionInterface<T,S> {
  final T Function(S argument) function;
  const YakFunction({
    @required this.function,
  }) : assert(function != null);

  @override
  T call(S argument) => function(argument);
}
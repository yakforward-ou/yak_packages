import 'package:yak_runner/yak_runner.dart';

abstract class Yak {
  static YakFunction<T,S> function(T Function(S argument) function) => YakFunction<T,S>(
    function: function
  );
}
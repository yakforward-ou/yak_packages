import 'package:yak_runner/src/delegates/results/success.dart';

abstract class Result<T> extends Success {
  T get result;
}

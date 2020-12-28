import 'success.dart';

abstract class Result<T> extends Success {
  const Result(this.data);
  final T data;
}

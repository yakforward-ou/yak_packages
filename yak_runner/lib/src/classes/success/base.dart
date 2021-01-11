import '../all.dart';

abstract class SuccessBase<T> implements Result<T> {
  const SuccessBase(this.data);
  final T data;
}

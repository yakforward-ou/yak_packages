import 'dart:async';
import '../error/error.dart';

mixin ErrorHandlerDelegate {
  void call(Object e, StackTrace s);
  Stream<YakError> get stream;
}

import 'dart:async';
import '../error/error.dart';
import 'delegate.dart';

class ErrorHandler implements ErrorHandlerDelegate {
  ErrorHandler() : _controller = StreamController<YakError>();
  final StreamController<YakError> _controller;

  void get dispose => _controller?.close();
  void call(Object e, StackTrace s) => _controller.sink.add(YakError(e, s));

  Stream<YakError> get stream => _controller.stream;
}

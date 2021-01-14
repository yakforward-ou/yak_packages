import 'dart:async';
import 'package:yak_error_handler/src/classes/error.dart';

class YakErrorHandler {
  YakErrorHandler() : _controller = StreamController<YakError>();
  final StreamController<YakError> _controller;

  void get dispose => _controller?.close();
  void call(Object e, StackTrace s) => _controller.sink.add(YakError(e, s));

  Stream<YakError> get stream => _controller.stream;
}

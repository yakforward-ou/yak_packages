import 'package:flutter/material.dart' show debugPrint;

import 'on_error_types.dart';

class OnErroDoNothing implements OnErrorDelegate {
  const OnErroDoNothing();
  @override
  void call(Object? p0, StackTrace? p1) {}
}

class OnErrorPrint implements OnErrorDelegate {
  const OnErrorPrint();
  @override
  void call(Object? p0, StackTrace? p1) => debugPrint('$p0\n$p1');
}

class RecordError implements OnErrorDelegate {
  RecordError._();
  static final _instance = RecordError._();
  factory RecordError() => _instance;
  OnError onError = const OnErrorPrint();

  @override
  void call(Object? p0, StackTrace? p1) => onError(p0, p1);
}

import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// [ResultNullaryX] turns a [Nullary] function
/// into a [ResultNullary] function
extension ResultNullaryX<T> on Nullary<T> {
  /// turns a [Nullary[ function into a [ResultNullary[ function
  /// eg:
  //**
  // ```dart
  // int meaningOfLife() => 42;
  // final result = meaningOfLife.run()
  // print(result.success); /// "42"
  // ```
  // */
  ResultNullary<T> get run => runNullary<T>(this);
}

/// [ResultNullaryFutureOrX] turns a [NullaryFutureOr] function
/// into a [ResultNullaryAsync] function
extension ResultNullaryFutureOrX<T> on NullaryFutureOr<T> {
  /// turns a [Nullary[ function into a [ResultNullary[ function
  /// eg:
  //**
  // ```dart
  // Future<int> meaningOfLife() async => 42;
  // final result = await meaningOfLife.run()
  // print(result.success); /// "42"
  // ```
  // */
  ResultNullaryAsync<T> get runAsync => runNullaryAsync<T>(this);
}

/// [ResultUnaryX] turns a [Unary function
/// into a [ResultUnary] function
extension ResultUnaryX<T, S> on Unary<T, S> {
  ///  turns a [Unary[ function into a [ResultUnary[ function
  /// eg:
  //**
  // ```dart
  // int double(int i)  => i * 2;
  // final result = await double.run(1)
  // print(result.success); /// "2"
  // ```
  // */
  ResultUnary<T, S> get run => runUnary<T, S>(this);
}

/// [ResultUnaryFutureOrX] turns a [UnaryFutureOr] function
/// into a [ResultUnaryAsync] function
extension ResultUnaryFutureOrX<T, S> on UnaryFutureOr<T, S> {
  ///  turns a [UnaryAsync[ function into a [ResultUnaryAsync[ function
  /// eg:
  //**
  // ```dart
  // Future<int> double(int i) async =>  i * 2;
  // final result = await double.run(1)
  // print(result.success); /// "2"
  // ```
  // */
  ResultUnaryAsync<T, S> get runAsync => runUnaryAsync<T, S>(this);
}

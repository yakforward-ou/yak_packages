import 'package:yak_result/yak_result.dart'
    show ResultNullaryAsync, ResultNullary, ResultUnaryAsync, ResultUnary;
import 'package:yak_utils/yak_utils.dart'
    show Nullary, NullaryAsync, Unary, UnaryAsync;

import '../all.dart';

/// `ResultNullaryX` turns a `Nullary` function
/// into a `ResultNullary` function
extension ResultNullaryX<T> on Nullary<T> {
  /// turns a `Nullary` function into a `ResultNullary` function
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

/// `ResultNullaryAsyncX` turns a `NullaryAsync` function
/// into a `ResultNullaryAsync` function
extension ResultNullaryAsyncX<T> on NullaryAsync<T> {
  /// turns a `Nullary` function into a `ResultNullary` function
  /// eg:
  //**
  // ```dart
  // Future<int> meaningOfLife() async => 42;
  // final result = await meaningOfLife.run()
  // print(result.success); /// "42"
  // ```
  // */
  ResultNullaryAsync<T> get run => runNullaryAsync<T>(this);
}

/// `ResultUnaryX` turns a `Unary` function
/// into a `ResultUnary` function
extension ResultUnaryX<T, S> on Unary<T, S> {
  ///  turns a `Unary` function into a `ResultUnary` function
  /// eg:
  //**
  // ```dart
  // int double(int i)  => i * 2;
  // final result = await double.run(1)
  // print(result.success); /// "2"
  // ```
  // */
  ResultUnary<T, S> get run => runUnary(this);
}

/// `ResultUnaryAsyncX` turns a `UnaryAsync` function
/// into a `ResultUnaryAsync` function
extension ResultUnaryAsyncX<T, S> on UnaryAsync<T, S> {
  ///  turns a `UnaryAsync` function into a `ResultUnaryAsync` function
  /// eg:
  //**
  // ```dart
  // Future<int> double(int i) async =>  i * 2;
  // final result = await double.run(1)
  // print(result.success); /// "2"
  // ```
  // */
  ResultUnaryAsync<T, S> get run => runUnaryAsync(this);
}

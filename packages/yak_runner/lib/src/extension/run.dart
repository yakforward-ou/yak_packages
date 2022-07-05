import '../all.dart';

/// `RunNullarySyncX` turns a `Nullary` function
/// into a `RunNullarySync` function
extension RunNullarySyncX<T> on Nullary<T> {
  /// turns a `Nullary` function into a `RunNullarySync` function
  /// eg:
  //**
  // ```dart
  // int meaningOfLife() => 42;
  // final result = meaningOfLife.run()
  // print(result.success); /// "42"
  // ```
  // */
  RunNullarySync<T> get run => runNullarySync<T>(this);
}

/// `RunNullaryAsyncX` turns a `NullaryAsync` function
/// into a `RunNullaryAsync` function
extension RunNullaryAsyncX<T> on NullaryAsync<T> {
  /// turns a `Nullary` function into a `RunNullarySync` function
  /// eg:
  //**
  // ```dart
  // Future<int> meaningOfLife() async => 42;
  // final result = await meaningOfLife.run()
  // print(result.success); /// "42"
  // ```
  // */
  RunNullaryAsync<T> get run => runNullaryAsync<T>(this);
}

/// `RunUnarySyncX` turns a `Unary` function
/// into a `RunUnarySync` function
extension RunUnarySyncX<T, S> on Unary<T, S> {
  ///  turns a `Unary` function into a `RunUnarySync` function
  /// eg:
  //**
  // ```dart
  // int double(int i)  => i * 2;
  // final result = await double.run(1)
  // print(result.success); /// "2"
  // ```
  // */
  RunUnarySync<T, S> get run => runUnarySync(this);
}

/// `RunUnaryAsyncX` turns a `UnaryAsync` function
/// into a `RunUnaryAsync` function
extension RunUnaryAsyncX<T, S> on UnaryAsync<T, S> {
  ///  turns a `UnaryAsync` function into a `RunUnaryAsync` function
  /// eg:
  //**
  // ```dart
  // Future<int> double(int i) async =>  i * 2;
  // final result = await double.run(1)
  // print(result.success); /// "2"
  // ```
  // */
  RunUnaryAsync<T, S> get run => runUnaryAsync(this);
}

import 'dart:async';

import 'package:yak_utils/yak_utils.dart';

/// an a class that lazily stores a [value] from a [generator] Function
class Cache<T> {
  final NullaryAsync<T> generator;

  Cache(this.generator);

  /// a constructor for a [sync] Function
  factory Cache.sync(Nullary<T> generator) => Cache(
        () => Future.sync(generator),
      );

  Future<void> initialize() async => _data ??= await generator();

  /// stores data from [generator]
  T? _data;

  /// getter for the cached [value]
  T get value => ready ? _data! : throw Exception('cache $T not initialized');

  /// getter for the status of the [data]
  bool get ready => _data != null;
}

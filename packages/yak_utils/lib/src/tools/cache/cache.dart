import 'package:yak_utils/yak_utils.dart';

/// an a class that lazily stores a [value] from a [generator] Function
class Cache<T> {
  final NullaryFutureOr<T> generator;

  Cache(this.generator);

  Future<void> _load() async => _data ??= await Future.sync(generator);

  Future<void> initialize() =>
      ready ? Future.sync(() {}) : _load().then((_) => ready = true);

  /// stores data from [generator]
  late T _data;

  /// getter for the cached [value]
  T get value =>
      ready ? _data : throw Exception('Cache<$T> is not initialized');

  /// getter for the status of the [data]
  var ready = false;
}

import 'package:yak_utils/yak_utils.dart';

/// an a class that lazily stores a [value] from a [generator] Function
class Cache<T> {
  final NullaryFutureOr<T> generator;

  Cache(this.generator);

  Future<void> initialize() async {
    if (ready) {
      return;
    }
    value = await Future.sync(generator);
    ready = true;
  }

  /// stores data from [generator]
  late T value;

  /// getter for the status of the [data]
  var ready = false;
}

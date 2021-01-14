import 'package:riverpod/all.dart';
import '../classes/all.dart';
import 'all.dart';

final handleError = Provider.autoDispose<Stream<YakError>>((ref) {
  final _controller = ref.read(errorHandler);
  ref.onDispose(() => _controller.dispose);
  return _controller.stream;
});

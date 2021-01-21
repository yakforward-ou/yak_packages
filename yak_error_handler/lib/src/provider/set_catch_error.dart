import 'package:riverpod/all.dart';
import '../defs/all.dart';
import 'error_handler.dart';

final setCatchError = Provider<SetCatchError>(
    (ref) => (CatchError c) => ref.read(errorHandler).onError = c);

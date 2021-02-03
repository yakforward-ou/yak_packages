import 'package:riverpod/all.dart';
import '../defs/all.dart';
import 'error_handler.dart';

final catchError =
    Provider<CatchError>((ref) => ref.read(errorHandler).onError);

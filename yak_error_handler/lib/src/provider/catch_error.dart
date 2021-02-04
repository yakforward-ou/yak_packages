import 'package:riverpod/all.dart';
import '../defs/all.dart';
import 'error_handler.dart';

/// `Provider` for `CatchError`

final catchError =
    Provider<CatchError>((ref) => ref.read(errorHandler).onError);

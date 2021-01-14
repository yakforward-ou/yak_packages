import 'package:riverpod/all.dart';
import 'package:yak_error_handler/src/typedef/catch.dart';
import 'error_handler.dart';

final catchError = Provider<Catch>((ref) => ref.read(errorHandler).call);

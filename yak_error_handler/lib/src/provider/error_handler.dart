import 'package:riverpod/all.dart';
import '../defs/all.dart';

/// `Provider` for `YakErrorHandler`

final errorHandler = Provider<YakErrorHandler>((ref) => YakErrorHandler());

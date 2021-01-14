import 'package:riverpod/all.dart';
import '../classes/error_handler.dart';

final errorHandler = Provider<YakErrorHandler>((ref) => YakErrorHandler());

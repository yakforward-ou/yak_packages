import 'package:riverpod/all.dart';
import '../classes/error_handler/implementation.dart';

final errorHandler = Provider<YakErrorHandler>((ref) => YakErrorHandler());

import 'package:riverpod/all.dart';
import '../classes/error_handler/implementation.dart';

final errorHandler = Provider<ErrorHandler>((ref) => ErrorHandler());

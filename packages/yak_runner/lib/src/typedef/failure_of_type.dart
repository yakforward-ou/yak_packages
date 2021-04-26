import 'package:yak_error_handler/yak_error_handler.dart';

import '../classes/all.dart';

/// a typedef for a function that `cast` a failure for a given type
typedef FailureOfType<T> = Failure<T> Function(ErrorReport report);

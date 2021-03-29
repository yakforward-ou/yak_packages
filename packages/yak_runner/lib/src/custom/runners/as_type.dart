import 'package:yak_error_handler/yak_error_handler.dart';

import '../../../yak_runner.dart';

/// a `UnaryRunner` that returns a T if contained in a given iterable
class AsType<T, S> extends UnaryRunner<T, S> {
  /// takes as constructor an optional `handleError`
  AsType([Function(Error e)? handleError])
      : super(
          (obj) => asType<T>(obj),
          errorHandlers: {
            AsTypeError().handle(handleError),
          },
        );
}

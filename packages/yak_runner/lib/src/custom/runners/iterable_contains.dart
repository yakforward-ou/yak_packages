import 'package:yak_error_handler/yak_error_handler.dart';

import '../../all.dart';

/// a `UnaryRunner` that returns a T if contained in a given iterable
class IterableContains<T> extends UnaryRunner<T, T> {
  /// an iterable of elements of type <T>
  final Iterable<T> elements;
  //final void Function(AvowError e) _callback;

  /// takes as constructors an `Iterable` and an optional `handleError`
  IterableContains(this.elements, [Function(Error e)? handleError])
      : super((element) {
          avow(elements.contains(element));
          return element;
        }, errorHandlers: {
          AvowError().handle(handleError),
        });
}

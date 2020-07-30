import 'dart:async';
import 'package:meta/meta.dart';

abstract class YakStreamTransformerInterface<S, T> {
  Stream<S> call({
    @required Stream<T> stream,
  });
}

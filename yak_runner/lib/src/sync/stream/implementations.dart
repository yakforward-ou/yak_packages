import 'dart:async';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/sync/unary/implementation.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'interfaces.dart';

class YakStreamTransformer<S, T>
    implements YakStreamTransformerInterface<S, T> {
  const YakStreamTransformer({
    @required this.runner,
    this.onFailure,
    this.onDone,
    this.onStreamError,
  }) : assert(runner != null);
  final YakUnary<S, T> runner;
  final void Function(Failure failure) onFailure;
  final void Function(EventSink<S>) onDone;
  final void Function(Object object, StackTrace stackTrace, EventSink<S>)
      onStreamError;

  @protected
  @override
  Stream<S> call({
    @required Stream<T> stream,
  }) =>
      StreamTransformer<T, S>.fromHandlers(
        handleData: (T data, Sink<S> sink) => runner(data).fold(
          onFailure,
          (S r) => sink.add(r),
        ),
        handleError: onStreamError,
        handleDone: onDone,
      ).bind(stream);
}

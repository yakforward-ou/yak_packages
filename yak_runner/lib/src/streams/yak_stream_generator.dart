import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/yak_runner.dart';

class YakStreamGenerator<T> {
  final FutureOr<Either<Failure, T>> Function() function;
  final Function(Failure failure) onFailure;
  const YakStreamGenerator({
    @required this.function,
    this.onFailure,
  }) : assert(function != null);

  Stream<T> call({@required Stream inbound}) =>
      StreamTransformer.fromHandlers(handleData: (_, Sink<T> sink) async {
        final Either<Failure, T> _processed = await function();
        _processed.fold((l) => onFailure(l), (r) => sink.add(r));
      }).bind(inbound);
}

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/yak_runner.dart';

class YakStreamGenerator<T> {
  final YakAsyncGenerator generator;
  final void Function(Failure failure) onFailure;
  const YakStreamGenerator(
    {
    @required this.generator,
    @required this.onFailure,
  }): assert(generator != null);

  Stream<T> call({@required Stream stream}) =>  StreamTransformer.fromHandlers(
        handleData: (dynamic data, Sink<T> sink) async {
          final Either<Failure, T> _processed = await generator();
          _processed.fold(
            (Failure l) => onFailure(l),
            (T r) => sink.add(r),
          );
        },
      ).bind(stream);
}

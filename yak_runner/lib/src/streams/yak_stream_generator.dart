// import 'dart:async';
// import 'package:dartz/dartz.dart';
// import 'package:meta/meta.dart';
// import 'package:yak_runner/yak_runner.dart';

// class YakStreamGenerator<T> {
//   const YakStreamGenerator(
//     {
//     @required this.generator,
//     @required this.onFailure,
//   }): assert(
//     generator != null, 
//     onFailure != null,
//   );
//   final YakAsyncGenerator<T> generator;
//   final void Function(Failure failure) onFailure;

//   Stream<T> call({@required Stream stream}) =>  StreamTransformer<dynamic,T>.fromHandlers(
//         handleData: (dynamic data, Sink<T> sink) async {
//           final Either<Failure, T> _processed = await generator();
//           _processed.fold(
//             (Failure l) => onFailure(l),
//             (T r) => sink.add(r),
//           );
//         },
//       ).bind(stream);
// }

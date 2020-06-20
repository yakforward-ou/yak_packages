// import 'dart:async';
// import 'package:dartz/dartz.dart';
// import 'package:meta/meta.dart';
// import 'package:yak_runner/yak_runner.dart';

// class YakStreamFunction<T,S> {
//   const YakStreamFunction(
//     {
//     @required this.function,
//     @required this.onFailure,
//   }): assert(
//     function != null, 
//     onFailure != null,
//   );
//   final YakAsyncFunction<T,S> function;
//   final void Function(Failure failure) onFailure;

//   Stream<T> call({@required Stream<S> stream}) =>  StreamTransformer<S,T>.fromHandlers(
//         handleData: (S data, Sink<T> sink) async {
//           final Either<Failure, T> _processed = await function(data);
//           _processed.fold(
//             (Failure l) => onFailure(l),
//             (T r) => sink.add(r),
//           );
//         },
//       ).bind(stream);
// }

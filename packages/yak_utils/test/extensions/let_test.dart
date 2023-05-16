void main() {
  /// TODO re enable when [stub] and [yak_test] are re-published
}


// import 'package:stub/stub.dart';
// import 'package:test/test.dart';
// import 'package:yak_utils/yak_utils.dart';

// void main() {
//   group('LetX', () {
//     final tester = Stub.unary<int, String>();
//     setUp(() {
//       tester.reset();
//       tester.stub = (t) => t.length;
//     });
//     test(
//         'GIVEN an String T  '
//         'WHEN  T.let(Unary<int,String>) '
//         'THEN returns int,', () {
//       const t = 'hello';
//       expect(
//         t.let(tester),
//         isA<int>(),
//         reason: 'should return a `int`',
//       );
//     });
//     test(
//         'GIVEN an String T  '
//         'WHEN  T.let(Unary<int,String>) '
//         'THEN Unary is called once', () {
//       final _ = 'hello'.let(tester);
//       expect(
//         tester.count,
//         equals(1),
//         reason: 'should be called once',
//       );
//     });
//   });

//   group('LetAsyncX', () {
//     final tester = Stub.unary<Future<int>, String>();
//     setUp(() {
//       tester.reset();
//       tester.stub = (t) => Future.sync(() => t.length);
//     });
//     test(
//         'GIVEN an String T  '
//         'WHEN  T.letAsync(UnaryAsync<int,String>) '
//         'THEN returns int,', () async {
//       const t = 'hello';
//       await expectLater(
//         await t.let(tester),
//         isA<int>(),
//         reason: 'should return a `int`',
//       );
//     });
//     test(
//         'GIVEN an String T  '
//         'WHEN  T.letAsync(UnaryAsync<int,String>) '
//         'THEN Unary is called once', () async {
//       final _ = await 'hello'.let(tester);
//       expect(
//         tester.count,
//         equals(1),
//         reason: 'should be called once',
//       );
//     });
//   });
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:yak_math/yak_math.dart';
// import 'package:vector_math/vector_math_64.dart';

// void main() {
//   group('`YakMatrix4Tween` test', () {
//     test(
//         'WHEN `YakMatrix4Tween` and `Matrix4Tween` lerp '
//         'THEN output is identical', () {
//       final begin = Matrix4.zero();
//       final end = Matrix4(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
//       const lerp = 1 / 3;
//       final yakTween = YakMatrix4Tween(begin: begin, end: end);
//       final tween = Matrix4Tween(begin: begin, end: end);

//       expect(
//         MatrixUtils.matrixEquals(yakTween.lerp(lerp), tween.lerp(lerp)),
//         true,
//         reason: '`YakMatrix4Tween` & `Matrix4Tween` lerp '
//             'should have the same value',
//       );
//     });
//   });
// }

// !! await for [https://github.com/flutter/flutter/issues/75785]

void main() {}

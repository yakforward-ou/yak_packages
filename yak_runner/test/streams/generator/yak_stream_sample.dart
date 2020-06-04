/// source [https://dart.dev/tutorials/language/streams]

import 'dart:async';

class TestStream {

  static Future<int> result(Stream<int> stream) async {
    int _sum = 0;
    await for (int value in stream) {
      _sum += value;
    }
    return _sum;
  }

  static Stream<int> outbound(int to) async* {
    for (int i = 1; i <= to; i++) {
      yield i;
    }
  }

}
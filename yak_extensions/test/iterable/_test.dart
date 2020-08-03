import 'package:flutter_test/flutter_test.dart';
import 'package:yak_extensions/yak_extensions.dart';

class Foo {
  Foo([this.i]);
  int i;
}

void main() {
  group('[YakIterableExtensionsWithType<T>]', () {
    test('[valueType] of a List<int> should return int', () async {
      final Type _t = int;
      final List<int> _listOfInt = <int>[];
      expect(_listOfInt.valueType, _t);
    });

    test('[valueType] of a List<Foo> should return Foo', () async {
      final Type _t = Foo;
      final List<Foo> _listOfFoo = <Foo>[];
      expect(_listOfFoo.valueType, _t);
    });

    test('[distinct] of a List<T> should return a "distinct()"', () async {
      final List<int> _foos = [1, 1];
      expect(_foos.distinct.length, 1);
    });
  });

  group('[YakIterableExtensionsTypeless]', () {
    test('[isDistinct] return [true] if the Iterable does not have duplicates',
        () async {
      expect(<int>[1, 2, 3, 4, 5].isDistinct, true);
    });

    test('[isDistinct] return [false] if the Iterable does not have duplicates',
        () async {
      expect(<int>[1, 1].isDistinct, false);
    });
  });

  group('[YakIterableOfNumExtension]', () {
    test('[crescent] of a List<T> should order the list from lower to higher',
        () async {
      final Iterable<int> _foos = [for (int i = 0; i < 5; ++i) i];
      final Iterable<int> _reverse = _foos.toList().reversed;
      expect(_reverse.crescent, _foos);
    });
  });
}

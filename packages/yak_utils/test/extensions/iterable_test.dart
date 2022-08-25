import 'package:test/test.dart';
import 'package:yak_utils/yak_utils.dart';

void main() {
  group('`EmptyOnNullX` test', () {
    const iterable = [1, 2, 3];
    const list = [...iterable];
    const set = {...iterable};

    Iterable<int>? maybeIterable;
    List<int>? maybeList;
    Set<int>? maybeSet;
    test(
        'GIVEN a Iterable<T>? '
        'WHEN the iterable is null '
        'THEN  return empty', () {
      maybeIterable = null;
      expect(
        maybeIterable.emptyOnNull,
        [],
        reason: 'should return an empty iterable',
      );

      maybeList = null;
      expect(
        maybeList.emptyOnNull,
        List<int>.empty(),
        reason: 'should return an empty list',
      );

      maybeSet = null;
      expect(
        maybeSet.emptyOnNull,
        <int>{},
        reason: 'should return an empty Set',
      );
    });
    test(
        'GIVEN a Iterable<T>? '
        'WHEN the iterable is not null '
        'THEN  return a non-nullable Iterable', () {
      maybeIterable = iterable;
      expect(
        maybeIterable.emptyOnNull,
        iterable,
        reason: 'should return an empty iterable',
      );

      maybeList = list;
      expect(
        maybeList.emptyOnNull,
        list,
        reason: 'should return an empty list',
      );

      maybeSet = set;
      expect(
        maybeSet.emptyOnNull,
        set,
        reason: 'should return an empty Set',
      );
    });

    test(
        'GIVEN all the above'
        'WHEN using a `...` operator'
        'THEN should play well', () {
      maybeList = null;

      expect(
        [...maybeList.emptyOnNull],
        List<int>.empty(),
        reason: 'should return an empty list',
      );

      maybeSet = null;
      expect(
        {...maybeList.emptyOnNull},
        <int>{},
        reason: 'should return an empty Set',
      );
    });
  });

  group('IterableEqualityX', () {
    final list = [for (var i = 0; i < 100; ++i) i];
    final list2 = [for (var i = 1; i <= 100; ++i) i];

    test(
        'GIVEN an Iterable list '
        'WHEN list.equals(list) '
        'THEN returns true', () {
      expect(
        list.equals(list),
        isTrue,
        reason: 'should return "true"',
      );
    });
    test(
        'GIVEN an Iterable list '
        'WHEN list.equals(list2) '
        'THEN returns false', () {
      expect(
        list.equals(list2),
        isFalse,
        reason: 'should return "false"',
      );
    });
  });
}

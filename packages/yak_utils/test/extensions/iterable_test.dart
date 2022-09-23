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

  group('ListEqualityX', () {
    final list = [for (var i = 0; i < 100; ++i) i];
    final list2 = [for (var i = 1; i <= 100; ++i) i];

    test(
        'GIVEN an List list '
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
  group('SetEqualityX', () {
    final set = {for (var i = 0; i < 100; ++i) i};
    final set2 = {for (var i = 1; i <= 100; ++i) i};

    test(
        'GIVEN a Set set '
        'WHEN set.equals(set) '
        'THEN returns true', () {
      expect(
        set.equals(set),
        isTrue,
        reason: 'should return "true"',
      );
    });
    test(
        'GIVEN a Set set '
        'WHEN set.equals(set2) '
        'THEN returns false', () {
      expect(
        set.equals(set2),
        isFalse,
        reason: 'should return "false"',
      );
    });
  });
  group('MapEqualityX', () {
    final map = {for (var i = 0; i < 100; ++i) '$i': i};
    final map2 = {for (var i = 1; i <= 100; ++i) '$i': i};

    test(
        'GIVEN an Map map '
        'WHEN map.equals(map) '
        'THEN returns true', () {
      expect(
        map.equals(map),
        isTrue,
        reason: 'should return "true"',
      );
    });
    test(
        'GIVEN an Map map '
        'WHEN map.equals(map2) '
        'THEN returns false', () {
      expect(
        map.equals(map2),
        isFalse,
        reason: 'should return "false"',
      );
    });
  });
  group('IterableContainsAnyX', () {
    group('map test', () {
      final map = {for (var i = 0; i < 100; ++i) '$i': i};
      final map2 = {for (var i = 0; i <= 1; ++i) '$i': i};
      final map3 = {for (var i = -100; i <= -1; ++i) '$i': i};

      test(
          'GIVEN an Map map and map2 '
          'WHEN maps have elements in common '
          'THEN returns true', () {
        expect(
          map.containsAny(map2),
          isTrue,
          reason: 'should return "true"',
        );
      });

      test(
          'GIVEN an Map set and set3 '
          'WHEN maps do not have elements in common '
          'THEN returns true', () {
        expect(
          map.containsAny(map3),
          isFalse,
          reason: 'should return "false"',
        );
      });
    });
    group('set test', () {
      final set = {for (var i = 0; i < 100; ++i) i};
      final set2 = {for (var i = 0; i <= 1; ++i) i};
      final set3 = {for (var i = -100; i <= -1; ++i) i};

      test(
          'GIVEN an Set set and set2 '
          'WHEN sets have elements in common '
          'THEN returns true', () {
        expect(
          set.containsAny(set2),
          isTrue,
          reason: 'should return "true"',
        );
      });

      test(
          'GIVEN an Set set and set3 '
          'WHEN sets do not have elements in common '
          'THEN returns true', () {
        expect(
          set.containsAny(set3),
          isFalse,
          reason: 'should return "false"',
        );
      });
    });

    group('list test', () {
      final list = [for (var i = 0; i < 100; ++i) i];
      final list2 = [for (var i = 0; i <= 1; ++i) i];
      final list3 = [for (var i = -100; i <= -1; ++i) i];

      test(
          'GIVEN an List list and list2 '
          'WHEN lists have elements in common '
          'THEN returns true', () {
        expect(
          list.containsAny(list2),
          isTrue,
          reason: 'should return "true"',
        );
      });

      test(
          'GIVEN an Set set and set3 '
          'WHEN set and set do not have elements in common '
          'THEN returns true', () {
        expect(
          list.containsAny(list3),
          isFalse,
          reason: 'should return "false"',
        );
      });
    });
  });
}

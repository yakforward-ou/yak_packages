import 'package:test/test.dart';
import 'package:yak_runner/yak_runner.dart';

void main() {
  const _iterable = [1, 2, 3];
  const _list = [..._iterable];
  const _set = {..._iterable};

  Iterable<int>? maybeIterable;
  List<int>? maybeList;
  Set<int>? maybeSet;
  group('`EmptyOnNullX` test', () {
    test(
        'GIVEN a Iterable<T>? '
        'WHEN the iterable is null '
        'THEN  return empty', () {
      maybeIterable = null;
      expect(
        maybeIterable.emptyOnNull,
        Iterable<int>.empty(),
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
      maybeIterable = _iterable;
      expect(
        maybeIterable.emptyOnNull,
        _iterable,
        reason: 'should return an empty iterable',
      );

      maybeList = _list;
      expect(
        maybeList.emptyOnNull,
        _list,
        reason: 'should return an empty list',
      );

      maybeSet = _set;
      expect(
        maybeSet.emptyOnNull,
        _set,
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
}

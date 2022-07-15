import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:yak_tween/yak_tween.dart';

void main() {
  group('`YakTextStyleTween` test', () {
    const begin = TextStyle(color: Color.fromRGBO(255, 0, 0, 1));
    const end = TextStyle(color: Color.fromRGBO(255, 255, 0, 1));
    final beginStyle = begin.copyWith(
      background: Paint()..color = begin.color!,
      foreground: Paint()..color = begin.color!,
    );
    final endStyle = begin.copyWith(
      background: Paint()..color = end.color!,
      foreground: Paint()..color = end.color!,
    );

    final yakTween = YakTextStyleTween(begin: beginStyle, end: endStyle);

    test(
        'WHEN `YakTextStyleTween` and `TextStyleTween` lerp '
        'THEN output is identical', () {
      const t = 1 / 3;
      const yakTween = YakTextStyleTween(begin: begin, end: end);
      final tween = TextStyleTween(begin: begin, end: end);
      expect(
        yakTween.lerp(t),
        tween.lerp(t),
        reason: '`YakTextStyleTween` & `TextStyleTween` lerp the same output',
      );
    });
    test(
        'GIVEN begin.foreground == null & end.foreground == null'
        'WHEN lerp '
        'THEN foregroun == null', () {
      const t = .0;
      const yakTween = YakTextStyleTween(begin: begin, end: end);
      expect(
        yakTween.lerp(t).foreground,
        isNull,
        reason: 'foreground should be null',
      );
    });
    test(
        'GIVEN begin.background == null & end.background == null'
        'WHEN lerp '
        'THEN background == null', () {
      const t = .0;
      const yakTween = YakTextStyleTween(begin: begin, end: end);
      expect(
        yakTween.lerp(t).background,
        isNull,
        reason: 'background should be null',
      );
    });
    test(
        'GIVEN t = 0'
        'WHEN lerp '
        'THEN foreground == begin color', () {
      const t = .0;
      expect(
        yakTween.lerp(t).foreground,
        beginStyle.foreground,
        reason: 'foreground should match begin.color',
      );
    });
    test(
        'GIVEN t = 0'
        'WHEN lerp '
        'THEN background == begin color', () {
      const t = .0;
      expect(
        yakTween.lerp(t).background,
        beginStyle.background,
        reason: 'background should match begin.color',
      );
    });
    test(
        'GIVEN t = 1'
        'WHEN lerp '
        'THEN foreground == end color', () {
      const t = 1.0;
      expect(
        yakTween.lerp(t).foreground,
        endStyle.foreground,
        reason: 'foreground should match end.color',
      );
    });
    test(
        'GIVEN t = 0'
        'WHEN lerp '
        'THEN background == end color', () {
      const t = 1.0;
      expect(
        yakTween.lerp(t).background,
        endStyle.background,
        reason: 'background should match end.color',
      );
    });
  });
}

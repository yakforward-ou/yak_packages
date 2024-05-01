import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';

typedef ScaleMediaQuery = MediaQueryData Function(
  MediaQueryData mediaQuery,
  double scale,
);

MediaQueryData _defaultScaleMediaQuery(
  MediaQueryData mediaQuery,
  double scale,
) =>
    mediaQuery.copyWith(
      textScaler: TextScaler.linear(scale),
    );

class ScaleMediaQueryWidget extends MediaQueryWidget {
  final double scale;
  final WidgetBuilder builder;
  final ScaleMediaQuery scaleMediaQuery;

  const ScaleMediaQueryWidget({
    required this.builder,
    required this.scale,
    ScaleMediaQuery? scaleMediaQuery,
    super.key,
  }) : scaleMediaQuery = scaleMediaQuery ?? _defaultScaleMediaQuery;

  @override
  Widget build(context) => key == null
      ? Builder(builder: builder)
      : KeyedSubtree(
          key: key,
          child: Builder(builder: builder),
        );

  @override
  MediaQueryData mediaQueryFrom(MediaQueryData mediaQuery) => scaleMediaQuery(
        mediaQuery,
        scale,
      );
}

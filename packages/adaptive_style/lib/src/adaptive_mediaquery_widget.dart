import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';

class AdaptiveMediaQueryWidget extends MediaQueryWidget {
  final double scale;
  final WidgetBuilder builder;
  const AdaptiveMediaQueryWidget({
    required this.builder,
    required this.scale,
    super.key,
  });

  @override
  Widget build(context) => key == null
      ? Builder(builder: builder)
      : KeyedSubtree(
          key: key,
          child: Builder(builder: builder),
        );

  @override
  MediaQueryData mediaQueryFrom(MediaQueryData mediaQuery) =>
      mediaQuery.copyWith(
        textScaler: TextScaler.linear(scale),
      );
}

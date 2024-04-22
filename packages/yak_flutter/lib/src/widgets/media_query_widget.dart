import 'package:flutter/widgets.dart';

abstract class MediaQueryWidget extends Widget {
  const MediaQueryWidget({super.key});

  @override
  ComponentElement createElement() => MediaQueryElement(this);

  MediaQueryData mediaQueryFrom(MediaQueryData mediaQuery);

  Widget build(BuildContext context);
}

class MediaQueryElement extends ComponentElement {
  MediaQueryElement(MediaQueryWidget super.widget);

  @override
  Widget build() {
    final mediaQueryWidget = widget as MediaQueryWidget;
    return MediaQuery(
      data: mediaQueryWidget.mediaQueryFrom(MediaQuery.of(this)),
      child: Builder(
        builder: mediaQueryWidget.build,
      ),
    );
  }

  @override
  void update(MediaQueryWidget newWidget) {
    super.update(newWidget);
    assert(widget == newWidget);
    rebuild(force: true);
  }
}

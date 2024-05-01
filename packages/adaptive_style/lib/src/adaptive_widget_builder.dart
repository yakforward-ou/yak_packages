import 'package:flutter/widgets.dart';

import 'scale_ref.dart';

/// a function that return a `Widget` from a
/// `BuildContext` a `ScaleRef` and the `Size` of the parent Widget
typedef AdaptiveWidgetBuilder = Widget Function(
  BuildContext context,
  ScaleRef scaleRef,
  Size parentSize,
);

mixin AdaptiveWidgetBuilderMixin on Widget {
  Widget builder(
    BuildContext context,
    ScaleRef scaleRef,
    Size parentSize,
  );
}

typedef AdaptiveChildrenBuilder = List<Widget> Function(
  BuildContext context,
  ScaleRef scaleRef,
  Size parentSize,
);

mixin AdaptiveChildrenBuilderrMixin on Widget {
  List<Widget> builder(
    BuildContext context,
    ScaleRef scaleRef,
    Size parentSize,
  );
}

import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';

import 'scale_ref.dart';

typedef ScaleRefNotifier = RestrictedNotifier<ScaleRef>;

class InheritedScaleRef extends InheritedWidget {
  const InheritedScaleRef({
    super.key,
    required this.scaleRef,
    required super.child,
  });

  final ScaleRef scaleRef;

  static ScaleRef? maybeOf(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<InheritedScaleRef>();

    if (inherited == null) {
      return null;
    }

    return inherited.scaleRef;
  }

  @override
  bool updateShouldNotify(covariant InheritedScaleRef oldWidget) =>
      oldWidget.scaleRef != scaleRef;
}

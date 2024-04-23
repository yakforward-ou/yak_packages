import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';

import 'adaptive_size.dart';

class InheritedAdaptiveSize
    extends InheritedRestrictedNotifier<AdaptiveSizeData> {
  const InheritedAdaptiveSize({
    super.key,
    required super.notifier,
    required super.child,
  });

  static AdaptiveSizeNotifier? maybeOf(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<InheritedAdaptiveSize>();

    if (inherited == null) {
      return null;
    }

    return inherited.notifier;
  }
}

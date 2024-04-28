import 'package:flutter/widgets.dart';
import 'package:yak_flutter/yak_flutter.dart';

import 'size_ref.dart';

typedef AdaptiveSizeNotifier = RestrictedNotifier<SizeRef>;

class InheritedSizeRef extends InheritedRestrictedNotifier<SizeRef> {
  const InheritedSizeRef({
    super.key,
    required super.notifier,
    required super.child,
  });

  static AdaptiveSizeNotifier? maybeOf(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<InheritedSizeRef>();

    if (inherited == null) {
      return null;
    }

    return inherited.notifier;
  }
}

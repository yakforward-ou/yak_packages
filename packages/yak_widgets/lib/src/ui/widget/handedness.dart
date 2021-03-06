import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../yak_widgets.dart';

/// a ready to use `Positioned` that changes  according to`handednessPod` state
class YakHandedness extends HookWidget {
  /// requires a `child` parameter
  final Widget child;

  /// `YakHandedness` constructor has parameters Widget `child` and Key `key`
  YakHandedness({
    required this.child,
    Key key = const ValueKey('YakHandedness'),
  })
  // coverage:ignore-line
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lefthanded = useProvider(handednessPod).state;
    return Positioned(
      key: ValueKey('$key: Positioned'),
      right: lefthanded ? null : 0,
      left: lefthanded ? 0 : null,
      child: child,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

/// a ready to use `Positioned` that changes  according to`handednessPod` state

class HandednessWidget extends HookWidget {
  HandednessWidget({@required this.child, key})
      : super(key: key ?? UniqueKey());
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final handedness = useProvider(handednessPod).state;
    return Positioned(
      key: ValueKey('$key: Positioned'),
      right: handedness == Handedness.righthanded ? 0 : null,
      left: handedness == Handedness.lefthanded ? 0 : null,
      child: child,
    );
  }
}

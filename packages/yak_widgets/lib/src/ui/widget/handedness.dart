import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../yak_widgets.dart';

/// a ready to use `Positioned` that changes  according to`handednessPod` state
class Handedness extends HookWidget {
  /// requires a `child` parameter
  final Widget child;

  /// an optionl parameter mirroring `Positioned` top
  final double? top;

  /// an optionl parameter mirroring `Positioned` bottom
  final double? bottom;

  /// set the parameter to either `left` or `right`
  final double? padding;

  /// `YakHandedness` constructor has parameters Widget `child` and Key `key`
  Handedness({
    required this.child,
    this.bottom,
    this.top,
    this.padding = 0,
    Key key = const ValueKey('Handedness'),
  })
  // coverage:ignore-line
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lefthanded = useProvider(handednessPod).state;
    return Positioned(
      key: ValueKey('$key@Positioned'),
      right: lefthanded ? null : padding,
      top: top,
      bottom: bottom,
      left: lefthanded ? padding : null,
      child: child,
    );
  }
}

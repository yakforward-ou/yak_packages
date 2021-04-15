import 'package:flutter/material.dart';

/// a ready to use `Positioned` that changes  according to`handednessPod` state
class Handedness extends StatelessWidget {
  /// requires a `child` parameter
  final Widget child;

  /// an optionl parameter mirroring `Positioned` top
  final double? top;

  /// an optionl parameter mirroring `Positioned` bottom
  final double? bottom;

  /// set the parameter to either `left` or `right`
  final double? padding;

  /// a ValueNotifier notifier that constrols the handedness
  /// it defaults to `false`
  final ValueNotifier<bool> lefthanded;

  /// `YakHandedness` constructor has parameters Widget `child` and Key `key`
  Handedness({
    required this.child,
    this.bottom,
    this.top,
    this.padding = 0,
    required this.lefthanded,
    Key key = const ValueKey('Handedness'),
  }) :
        // coverage:ignore-line
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        key: ValueKey('ValueListenableBuilder@$key'),
        valueListenable: lefthanded,
        builder: (context, value, _) {
          return Positioned(
            key: ValueKey('Positioned:$value@$key'),
            right: value ? null : padding,
            top: top,
            bottom: bottom,
            left: value ? padding : null,
            child: child,
          );
        });
  }
}

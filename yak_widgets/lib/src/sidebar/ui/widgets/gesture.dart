import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../../all.dart';

class SidebarGestureDetector extends HookWidget {
  const SidebarGestureDetector({
    @required this.threshold,
    @required this.child,
  }) : super(key: const ValueKey('ScrollbarGestureDetector'));
  final double threshold;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final scroll = useProvider(sidebarScrollPod);

    return GestureDetector(
      onVerticalDragUpdate: (details) {
        if (details.delta.dy.abs() > threshold &&
            details.delta.dx < threshold) {
          details.delta.dy < 0
              ? scroll.state = SidebarScroll.up
              : scroll.state = SidebarScroll.down;
        }
      },
      child: child,
    );
  }
}

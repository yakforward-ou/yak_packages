import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

class YakSidebar extends HookWidget {
  const YakSidebar({
    this.child,
    this.scrollSensitivity = .001,
    this.width = 54,
    Key key = const ValueKey('YakSidebar'),
  }) : super(key: key);
  final double scrollSensitivity;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final handedness = useProvider(handednessPod).state;
    final scroll = useProvider(sidebarPod);
    final height = MediaQuery.of(context).size.height;
    final threshold = height * scrollSensitivity;
    return Positioned(
      right: handedness == Handedness.righthanded ? 0 : null,
      left: handedness == Handedness.lefthanded ? 0 : null,
      child: SizedBox(
        height: height,
        width: width,
        child: GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy.abs() > threshold &&
                details.delta.dx < threshold) {
              details.delta.dy < 0
                  ? scroll.state = SidebarScroll.up
                  : scroll.state = SidebarScroll.down;
            }
          },
          child: child,
        ),
      ),
    );
  }
}

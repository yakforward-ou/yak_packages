import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/src/handedness/logic/pods/pod.dart';
import '../../../../src/all.dart';
import 'gesture.dart';

class YakSidebar extends HookWidget {
  const YakSidebar({
    this.child,
    this.scrollSensitivity = .001,
    this.width = 54,
  }) : super(key: const ValueKey('MyScrollBar'));
  final double scrollSensitivity;
  final double width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final handedness = useProvider(handednessPod).state;
    final size = MediaQuery.of(context).size;
    return Positioned(
      right: handedness == Handedness.righthanded ? 0 : null,
      left: handedness == Handedness.lefthanded ? 0 : null,
      child: SizedBox(
        height: size.height,
        width: width,
        child: SidebarGestureDetector(
          threshold: size.height * scrollSensitivity,
          child: child,
        ),
      ),
    );
  }
}

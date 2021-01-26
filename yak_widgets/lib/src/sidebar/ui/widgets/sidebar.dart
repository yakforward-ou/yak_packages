import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/src/handedness/logic/pods/pod.dart';
import '../../../handedness/logic/state/all.dart';

class MyScrollBar extends HookWidget {
  const MyScrollBar({
    @required this.controller,
    this.scrollSensitivity = .0005,
    this.duration,
    this.icons = const <Icon>[],
    this.background = const Color.fromRGBO(0, 0, 0, .3),
    this.width = 54,
  }) : super(key: const ValueKey('MyScrollBar'));
  final PageController controller;
  final double scrollSensitivity;
  final Duration duration;
  final List<Icon> icons;
  final Color background;
  final double width;

  void _scoll(DragUpdateDetails details, double threshold) {
    if (details.delta.dy.abs() > threshold && details.delta.dx < threshold) {
      details.delta.dy < 0
          ? controller.nextPage(duration: duration, curve: Curves.easeOut)
          : controller.previousPage(duration: duration, curve: Curves.easeOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final handedness = useProvider(handednessPod).state;
    return Positioned(
      right: handedness == Handedness.righthanded ? 0 : null,
      left: handedness == Handedness.lefthanded ? 0 : null,
      child: SizedBox(
        width: width,
        height: size.height,
        child: GestureDetector(
          onVerticalDragUpdate: (details) =>
              _scoll(details, size.height * scrollSensitivity),
          child: Material(
            color: background,
          ),
        ),
      ),
    );
  }
}

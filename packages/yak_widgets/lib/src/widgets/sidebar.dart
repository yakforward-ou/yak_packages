import 'package:flutter/material.dart';
import '../../yak_widgets.dart';

/// a ready to use widget that changes `sidebarPod` state

class Sidebar extends StatelessWidget {
  /// allow to change `scrollSensitivity` to a custom value; default `1%`
  final double scrollSensitivity;

  /// allow to change `width` to a custom value; default `54`
  final double width;

  /// you may provide a `child` althogh is not required
  final Widget child;

  /// a callback for a scroll movement
  final OnScroll onScroll;

  /// `Sidebar` does not require any
  const Sidebar({
    required this.child,
    required this.onScroll,
    this.scrollSensitivity = .01,
    this.width = 54,
    Key key = const ValueKey('Sidebar'),
  })
  // coverage:ignore-line
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final threshold = height * scrollSensitivity;
    return SizedBox(
      key: ValueKey('SizedBox@$key'),
      height: height,
      width: width,
      child: GestureDetector(
        key: ValueKey('GestureDetector@$key'),
        onVerticalDragUpdate: (details) {
          if (details.delta.dy.abs() > threshold &&
              details.delta.dx < threshold) {
            onScroll(details.delta.dy < 0);
          }
        },
        child: child,
      ),
    );
  }
}

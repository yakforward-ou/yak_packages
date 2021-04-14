import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../yak_widgets.dart';

/// a ready to use widget that uses `useDamperAnimationEffect`

class Damper extends HookWidget {
  /// requires a `children` parameter
  final List<Widget> children;

  /// `YakDamper` constructor has parameters List<Widget> `children` and Key
  const Damper({
    required this.children,
    Key key = const ValueKey('YakDamper'),
  })
  // coverage:ignore-line
  : super(key: key);

  @override
  Widget build(BuildContext context) {
    final damperState = useProvider(damperStatePod);
    final duration = useProvider(animationDurationPod);
    final curve = useProvider(animationCurvePod);
    final animationController = useAnimationController(
      duration: duration.state,
    );
    animationController.useDamperAnimationEffect(damperState);
    final size = MediaQuery.of(context).size;

    return PositionedTransition(
      key: ValueKey('$key@PositionedTransition'),
      rect: RelativeRectTween(
        begin: RelativeRect.fromSize(
          Rect.fromLTWH(
            0,
            0,
            size.width,
            size.height,
          ),
          size,
        ),
        end: RelativeRect.fromSize(
            Rect.fromLTWH(
              0,
              -size.height,
              size.width,
              size.height,
            ),
            size),
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: curve.state,
        ),
      ),
      child: SizedBox.fromSize(
        size: size,
        key: ValueKey('$key@SizedBox'),
        child: Stack(
          key: ValueKey('$key@Stack'),
          children: children,
        ),
      ),
    );
  }
}

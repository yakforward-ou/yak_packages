import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

/// a ready to use widget that uses `useDamperAnimationEffect`

class YakDamper extends HookWidget {
  const YakDamper({
    @required this.children,
    Key key = const ValueKey('YakDamper'),
  }) : super(key: key);
  final List<Widget> children;

  Key get subjectKey => ValueKey('$key: : SizedBox');

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
      key: ValueKey('$key: PositionedTransition'),
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
          size,
        ),
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: curve.state,
        ),
      ),
      child: SizedBox.fromSize(
        size: size,
        key: subjectKey,
        child: Stack(
          key: ValueKey('$key: : Stack'),
          children: children,
        ),
      ),
    );
  }
}

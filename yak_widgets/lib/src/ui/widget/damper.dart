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

  @override
  Widget build(BuildContext context) {
    final damperState = useProvider(damperStatePod);
    final duration = useProvider(animationDurationPod);
    final animationController = useAnimationController(
      duration: duration.state,
    );
    animationController.useDamperAnimationEffect(damperState);
    final size = MediaQuery.of(context).size;
    return PositionedTransition(
      key: const ValueKey('DamperWidget: PositionedTransition'),
      rect: RelativeRectTween(
        begin: RelativeRect.fromSize(
            Rect.fromLTWH(0, 0, size.width, size.height), size),
        end: RelativeRect.fromSize(
            Rect.fromLTWH(0, -size.height, size.width, size.height), size),
      ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Curves.easeOut,
        ),
      ),
      child: SizedBox.expand(
        key: const ValueKey('DamperWidget: SizedBox'),
        child: Stack(
          key: const ValueKey('DamperWidget: Stack'),
          children: children,
        ),
      ),
    );
  }
}

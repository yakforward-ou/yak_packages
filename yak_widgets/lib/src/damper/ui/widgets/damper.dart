import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../shared/all.dart';
import '../../logic/all.dart';

class DamperWidget extends HookWidget {
  const DamperWidget({
    @required this.children,
    this.duration = const Duration(milliseconds: 250),
  }) : super(key: const ValueKey('DamperWidget'));
  final List<Widget> children;
  final Duration duration;
  void _link(AnimationController controller, StateController state) {
    state.addListener((state) => state == DamperState.withdraw
        ? controller.forward()
        : controller.reverse());
  }

  @override
  Widget build(BuildContext context) {
    final _animationController = useAnimationController(duration: duration);

    final _state = useProvider(damperStatePod);
    _link(_animationController, _state);

    final _size = MediaQuery.of(context).size;
    return PositionedTransition(
      key: const ValueKey('DamperWidget: PositionedTransition'),
      rect: RelativeRectTween(
        begin: RelativeRect.fromSize(
            Rect.fromLTWH(0, 0, _size.width, _size.height), _size),
        end: RelativeRect.fromSize(
            Rect.fromLTWH(0, -_size.height, _size.width, _size.height), _size),
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      ),
      child: SizedBox.expand(
        key: const ValueKey('DamperWidget: SizedBox'),
        child: Stack(
            key: const ValueKey('DamperWidget: Stack'), children: children),
      ),
    );
  }
}

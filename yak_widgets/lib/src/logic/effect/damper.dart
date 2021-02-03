import 'package:flutter/animation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod/riverpod.dart';
import 'package:yak_widgets/yak_widgets.dart';

Effect _damperAnimationEffect(
  AnimationController controller,
  StateController<DamperState> state,
) =>
    () => state.addListener((state) => state == DamperState.withdraw
        ? controller.forward()
        : controller.reverse());

extension DamperAnimationEffect on AnimationController {
  void useDamperAnimationEffect(StateController<DamperState> state) =>
      useEffect(_damperAnimationEffect(this, state));
}

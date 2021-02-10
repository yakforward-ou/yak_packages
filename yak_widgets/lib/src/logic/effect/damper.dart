import 'package:flutter/animation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpod/riverpod.dart';
import '/yak_widgets.dart';

/// `hooks` effect for linking `AnimationController`
/// to `StateController<DamperState>`

extension DamperAnimationEffect on AnimationController {
  /// extension on `AnimationController`
  /// returns `useEffect` proving a `stateController<DamperState>`
  void useDamperAnimationEffect(StateController<DamperState> state) =>
      useEffect(_damperAnimationEffect(this, state));
}

Effect _damperAnimationEffect(
  AnimationController controller,
  StateController<DamperState> state,
) =>
    () => state.addListener((state) => state == DamperState.withdraw
        ? controller.forward()
        : controller.reverse());

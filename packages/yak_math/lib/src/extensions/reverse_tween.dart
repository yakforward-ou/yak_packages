import 'package:flutter/widgets.dart';
import '../../yak_math.dart';

/// an `extension`  that reverse the value of a `YakTween`
extension ReverseYakTweenExtension on YakTween {
  /// `reverse` return a `YakTween` with inverted `begin` and `end`
  YakTween get reverse => YakTween(begin: end, end: begin);
}

/// an `extension`  that reverse the value of a `Tween`
extension ReverseTweenExtension on Tween {
  /// `reverse` return a `Tween` with inverted `begin` and `end`
  Tween get reverse => Tween(begin: end, end: begin);
}

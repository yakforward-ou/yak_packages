import 'package:flutter/widgets.dart';

import '../tween.dart';

/// an `extension`  that reverse the value of a `YakTween`

extension ReverseYakTweenExtension on YakTween {
  YakTween get reverse => YakTween(begin: this.end, end: this.begin);
}

/// an `extension`  that reverse the value of a `Tween`

extension ReverseTweenExtension on Tween {
  Tween get reverse => Tween(begin: this.end, end: this.begin);
}

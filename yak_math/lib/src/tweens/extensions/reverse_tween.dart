import '../tween.dart';

extension ReverseYakTweenExtension on YakTween {
  YakTween get reverse => YakTween(begin: this.end, end: this.begin);
}

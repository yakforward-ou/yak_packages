import 'package:yak_runner/src/classes/failure/all.dart';
import '../../../typedef/all.dart';
import '../../../classes/all.dart';

mixin OnResult<S> on ResultBase<S> {
  Result<T> onResult<T>(Result<T> Function(S) runner,
      [FailureOfType<T> failureOfType]);
}
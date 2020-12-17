import 'package:freezed_annotation/freezed_annotation.dart';
import '../../delegates/results/success.dart';
import '../../delegates/results/failure.dart';

part 'sync.freezed.dart';

/// an union class created w/ `freezed` package, see `pubspec.yaml`

@freezed
abstract class Try with _$Try {
  @Implements(Success)
  const factory Try.success() = _TrySuccess;
  @Implements(Failure)
  const factory Try.failure(Object e, StackTrace s) = _TryFailure;
}

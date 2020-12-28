import 'package:freezed_annotation/freezed_annotation.dart';
import '../../results/result.dart';
import '../../results/failure.dart';
part 'sync.freezed.dart';

/// an union class created w/ `freezed` package, see `pubspec.yaml`

@freezed
abstract class TryAny<T> with _$TryAny<T> {
  @Implements(Result)
  const factory TryAny.result(T data) = _TryAnyResult;
  @Implements(Failure)
  const factory TryAny.failure(Object e, StackTrace s) = _TryAnyFailure;
}

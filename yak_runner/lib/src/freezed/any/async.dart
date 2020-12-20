import 'package:freezed_annotation/freezed_annotation.dart';
import '../../delegates/results/result.dart';
import '../../delegates/results/failure.dart';
import '../../delegates/results/loading.dart';
part 'async.freezed.dart';

/// an union class created w/ `freezed` package, see `pubspec.yaml`
///
/// better used with a `state_notifier` [https://pub.dev/packages/state_notifier]

@freezed
abstract class TryAnyAsync<T> with _$TryAnyAsync<T> {
  @Implements(Loading)
  const factory TryAnyAsync.loading() = _TryAnyAsyncLoading;
  @Implements(Result)
  const factory TryAnyAsync.result(T data) = _TryAnyAsyncResult;
  @Implements(Failure)
  const factory TryAnyAsync.failure(Object e, StackTrace s) =
      _TryAnyAsyncFailure;
}

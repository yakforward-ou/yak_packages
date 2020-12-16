import 'package:freezed_annotation/freezed_annotation.dart';
import '../../delegates/results/loading.dart';
import '../../delegates/results/failure.dart';
import '../../delegates/results/success.dart';
part 'async.freezed.dart';

/// an union class created w/ `freezed` package, see `pubspec.yaml`
///
/// better used with a `state_notifier` [https://pub.dev/packages/state_notifier]

@freezed
abstract class TryAsync with _$TryAsync {
  @Implements(Loading)
  const factory TryAsync.loading() = _TryAsyncLoading;
  @Implements(Success)
  const factory TryAsync.success() = _TryAsyncSuccess;
  @Implements(Failure)
  const factory TryAsync.failure(Object e, StackTrace s) = _TryAsyncFailure;
}

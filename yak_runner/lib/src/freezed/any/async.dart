import 'package:freezed_annotation/freezed_annotation.dart';
part 'async.freezed.dart';

/// an union class created w/ freezed package, see `pubspec.yaml`
///
/// better used with a `state_notifier` [https://pub.dev/packages/state_notifier]

@freezed
abstract class TryAnyAsync<T> with _$TryAnyAsync<T> {
  const factory TryAnyAsync.empty() = _Empty;
  const factory TryAnyAsync.loading() = _Loading;
  const factory TryAnyAsync.success(T result) = _Success;
  const factory TryAnyAsync.failure(Object e, StackTrace s) = _Failure;
}

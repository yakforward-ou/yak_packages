import 'package:freezed_annotation/freezed_annotation.dart';
part 'async.freezed.dart';

/// an union class created w/ freezed package, see `pubspec.yaml`
///
/// better used with a `state_notifier` [https://pub.dev/packages/state_notifier]

@freezed
abstract class TryAsync with _$TryAsync {
  const factory TryAsync.loading() = _Loading;
  const factory TryAsync.success() = _Success;
  const factory TryAsync.failure(Object e, StackTrace s) = _Failure;
}

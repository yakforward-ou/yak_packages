import 'package:freezed_annotation/freezed_annotation.dart';
part 'sync.freezed.dart';

/// an union class created w/ freezed package, see `pubspec.yaml`

@freezed
abstract class TryAny<T> with _$TryAny<T> {
  const factory TryAny.success(T result) = Success;
  const factory TryAny.failure(Object e, StackTrace s) = Failure;
}

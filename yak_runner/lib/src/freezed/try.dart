import 'package:freezed_annotation/freezed_annotation.dart';
part 'try.freezed.dart';

/// an union class created w/ `freezed` package, see `pubspec.yaml`

@freezed
abstract class Try<T> with _$Try<T> {
  const factory Try.success(T data) = _TryResult;
  const factory Try.failure(Object e, StackTrace s) = _TryFailure;
}

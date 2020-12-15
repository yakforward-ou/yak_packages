import 'package:freezed_annotation/freezed_annotation.dart';
part 'sync.freezed.dart';

/// an union class created w/ freezed package, see `pubspec.yaml`

@freezed
abstract class Try with _$Try {
  const factory Try.success() = Success;
  const factory Try.failure(Object e, StackTrace s) = Failure;
}

import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// represent a failure of a function
class Failure<T> implements Result<T> {
  /// has a const constructor
  const Failure({
    this.reason = const Object(),
    this.stackTrace = StackTrace.empty,
  });

  factory Failure.fromError(Error e) => Failure(
        reason: e,
        stackTrace: e.stackTrace ?? StackTrace.empty,
      );

  factory Failure.fromException(Exception e, StackTrace s) => Failure(
        reason: e,
        stackTrace: s,
      );

  ///  hold an `object`
  final Object reason;

  ///  hold an `stackTrace`
  final StackTrace stackTrace;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  int get hashCode => Object.hashAll([runtimeType, reason, stackTrace]);

  @override
  @nonVirtual
  Json toJson() => {
        '$runtimeType': {
          'reason': Error.safeToString(reason),
          'stackTrace': '$stackTrace',
        }
      };
}

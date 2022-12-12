import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// represent a failure of a function
class Failure<T> extends Result<T> implements ValueResult<T>, VoidResult<T> {
  final Object reason;
  final StackTrace stackTrace;

  const Failure([
    this.reason = const Object(),
    this.stackTrace = StackTrace.empty,
  ]);

  factory Failure.fromError(Error error) => Failure(
        error,
        error.stackTrace ?? StackTrace.empty,
      );

  @override
  @nonVirtual
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hashAll([runtimeType, reason, stackTrace]);

  @override
  @nonVirtual
  Json toJson() => {
        'Result': 'Failure',
        'reason': '${reason.runtimeType}',
        'stackTrace': '$stackTrace',
      };
}

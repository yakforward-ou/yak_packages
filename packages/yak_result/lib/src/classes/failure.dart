import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// represent a failure of a function
class Failure<T> extends Error implements Result<T>, Exception {
  /// has a const constructor
  Failure({this.reason, this.stackTrace});

  /// may hold an `object`
  final Object? reason;

  /// may hold an `stackTrace`
  @override
  final StackTrace? stackTrace;

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

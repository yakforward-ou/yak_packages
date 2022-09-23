import 'package:meta/meta.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

/// represent the state of a function not yet completed
class Pending<T> implements Result<T> {
  /// has a const constructor
  const Pending();

  @override
  @nonVirtual
  bool operator ==(Object other) => hashCode == other.hashCode;

  @override
  @nonVirtual
  int get hashCode => Object.hash(runtimeType, T.runtimeType);

  @override
  @nonVirtual
  String toString() => '${toJson()}';

  @override
  @nonVirtual
  Json toJson() => {'$runtimeType': {}};
}
